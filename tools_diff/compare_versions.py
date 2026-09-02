#!/usr/bin/env python3
# 比較舊版(3.0.A.0.22)與新版(3.0.A.0.36) smali 原始檔案，判斷是純工具鏈雜訊
# 還是真的邏輯差異。正規化邏輯抄自 tools_diff/smali_diff.py 的 normalize()。
import re, sys, os, difflib

OLD_DIRS = [
    "/home/h/tmp/SemcCameraUI/App_smali/app-scan3d-smali-ref/smali",
    "/home/h/tmp/SemcCameraUI/App_smali/app-scan3d-smali-ref/smali_classes2",
]
NEW_DIRS = [
    "/home/h/tmp/SemcCameraUI/App_smali/app-scan3d-smali-0.36-ref/smali",
    "/home/h/tmp/SemcCameraUI/App_smali/app-scan3d-smali-0.36-ref/smali_classes2",
]

REG_RE = re.compile(r'\b[vp]\d+\b')
LABEL_RE = re.compile(r':(?:goto|cond|try_start|try_end|catch|catchall|switch_data|array_data|sswitch_data|pswitch_data|sswitch|pswitch)_[A-Za-z0-9_]+\b')

def normalize(text):
    raw_lines = text.split('\n')
    out = []
    for line in raw_lines:
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        if line.startswith('.line ') or line.startswith('.locals ') or line.startswith('.registers '):
            continue
        line = re.sub(r'\s*#.*$', '', line)
        line = REG_RE.sub('R', line)
        line = LABEL_RE.sub(':L', line)
        out.append(line)
    return out

def find(dirs, rel):
    for d in dirs:
        p = os.path.join(d, rel)
        if os.path.isfile(p):
            return p
    return None

def main():
    rel = sys.argv[1]
    old_p = find(OLD_DIRS, rel)
    new_p = find(NEW_DIRS, rel)
    if not old_p:
        print(f"OLD MISSING: {rel}")
        return
    if not new_p:
        print(f"NEW MISSING: {rel}")
        return
    old_lines = normalize(open(old_p, encoding='utf-8').read())
    new_lines = normalize(open(new_p, encoding='utf-8').read())
    if old_lines == new_lines:
        print(f"IDENTICAL (normalized): {rel}")
        return
    sm = difflib.SequenceMatcher(None, old_lines, new_lines)
    print(f"DIFF ratio={sm.ratio():.3f} old_lines={len(old_lines)} new_lines={len(new_lines)}  {rel}")
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == 'equal':
            continue
        print(f"--- {tag} old[{i1}:{i2}] new[{j1}:{j2}]")
        for l in old_lines[i1:i2]:
            print(f"  - {l}")
        for l in new_lines[j1:j2]:
            print(f"  + {l}")

if __name__ == "__main__":
    main()
