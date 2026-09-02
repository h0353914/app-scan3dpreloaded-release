#!/usr/bin/env python3
# 進一步分類 compare_versions.py 的正規化 diff 結果：
# - IDENTICAL：正規化後完全相同 -> 純工具鏈雜訊，略過
# - RESID_ONLY：所有差異都只是 0x 常數值不同（R.id/R.string 等資源 ID
#   因為別處新增/刪除資源而整體重新編號，Java 用 R.xxx.yyy 具名引用，
#   不受影響）-> 略過
# - NEEDS_REVIEW：其餘，要人工看
import re, sys, os, difflib
sys.path.insert(0, os.path.dirname(__file__))
from compare_versions import normalize, find, OLD_DIRS, NEW_DIRS

HEX_RE = re.compile(r'0x[0-9a-fA-F]+')

def strip_hex(line):
    return HEX_RE.sub('#', line)

def classify(rel):
    old_p = find(OLD_DIRS, rel)
    new_p = find(NEW_DIRS, rel)
    if not old_p:
        return "OLD_MISSING", None
    if not new_p:
        return "NEW_MISSING", None
    old_lines = normalize(open(old_p, encoding='utf-8').read())
    new_lines = normalize(open(new_p, encoding='utf-8').read())
    if old_lines == new_lines:
        return "IDENTICAL", None
    sm = difflib.SequenceMatcher(None, old_lines, new_lines)
    # 把連續（中間沒有 equal 隔開）的 non-equal opcode 合併成一個 cluster 再比較，
    # 這樣像「同一段落只是常數位置被 difflib 判成 insert+delete 而不是單純
    # replace」的情況（實際上還是同一組指令、只是 resource id 常數不同）也能
    # 被正確歸類成資源 ID 重新編號，而不是誤判成 NEEDS_REVIEW。
    clusters = []
    cur = []
    for op in sm.get_opcodes():
        tag, i1, i2, j1, j2 = op
        if tag == 'equal':
            if cur:
                clusters.append(cur)
                cur = []
        else:
            cur.append(op)
    if cur:
        clusters.append(cur)

    real_hunks = []
    for cluster in clusters:
        old_chunk = []
        new_chunk = []
        for tag, i1, i2, j1, j2 in cluster:
            old_chunk.extend(old_lines[i1:i2])
            new_chunk.extend(new_lines[j1:j2])
        if len(old_chunk) == len(new_chunk):
            if all(strip_hex(a) == strip_hex(b) for a, b in zip(old_chunk, new_chunk)):
                continue  # pure hex constant diff, same order
        if sorted(strip_hex(l) for l in old_chunk) == sorted(strip_hex(l) for l in new_chunk):
            continue  # same multiset of lines (modulo hex consts), just reordered by matcher
        real_hunks.append(('cluster', old_chunk, new_chunk))
    if not real_hunks:
        return "RESID_ONLY", None
    # 最後一道保險：把整個檔案剩下的所有 cluster 全部攤平合併，如果全域的
    # multiset（去掉 hex 常數後）仍然相同，代表只是編譯器把同樣內容的方法/
    # 指令搬到檔案裡不同位置（例如方法宣告順序調換），不是邏輯差異。
    all_old = [l for _, oc, nc in real_hunks for l in oc]
    all_new = [l for _, oc, nc in real_hunks for l in nc]
    if sorted(strip_hex(l) for l in all_old) == sorted(strip_hex(l) for l in all_new):
        return "RESID_ONLY", None
    return "NEEDS_REVIEW", real_hunks

if __name__ == "__main__":
    rel = sys.argv[1]
    cat, hunks = classify(rel)
    print(cat)
    if hunks:
        for tag, old_chunk, new_chunk in hunks:
            print(f"  --- {tag}")
            for l in old_chunk:
                print(f"    - {l}")
            for l in new_chunk:
                print(f"    + {l}")
