# smali diff 工具：把 javac 編譯出的 .class -> d8 -> baksmali 得到的 smali_out
# 跟原版 smali（見 SMALI_REF_REPO，一個指向 smali-3.0.A.0.22-a9 分支的常駐
# git worktree，java 分支本身已經不含 smali/smali_classes2 了）逐 class 比對，
# 用 PORTING_STATUS.md 驅動要比對哪些 class。
#
# 重建 NEW_DIR（smali_out）的完整管線指令（NEW_DIR 目前指向 scratchpad，
# 是 ephemeral 的，下個 session 要重新產生一次）：
#
#   JAVAC=/home/h/lineageos/prebuilts/jdk/jdk8/linux-x86/bin/javac
#   JAVA=/home/h/lineageos/prebuilts/jdk/jdk11/linux-x86/bin/java
#   ANDROID_JAR=/home/h/lineageos/prebuilts/sdk/28/public/android.jar
#   HTTP_LEGACY=/home/h/lineageos/prebuilts/sdk/28/public/org.apache.http.legacy.jar
#   REPO=/home/h/tmp/SemcCameraUI/App_smali/app-scan3d
#   # 1) 收集第三方依賴 jar：用 <REPO>/../../.tmp（或任一 scratch 目錄）建一個
#   #    java-library 專案，dependencies 見本次 commit message／app/build.gradle.kts，
#   #    跑 gradle resolveDeps 把 resolvedConfiguration 的 jar 複製出來，
#   #    .aar 要另外 unzip 取 classes.jar。第三方裡 Maven 上沒有的部分
#   #    （LVL/downloader/xmltojsonlib/sysmonservice）用 REPO/vendor-stubs/src
#   #    另外編譯成 vendor-stubs.jar 一起併入 classpath。
#   # 2) 編譯：
#   find "$REPO/app/src/main/java/com/sonymobile/scan3d" -name "*.java" > all_sources.txt
#   "$JAVAC" -encoding UTF-8 -nowarn -Xmaxerrs 100000 -d build_out \
#       -cp "$ANDROID_JAR:$HTTP_LEGACY:<第三方 jar 們>:vendor-stubs.jar" \
#       -sourcepath "$REPO/app/src/main/java" @all_sources.txt
#   # 3) d8 轉 dex(用 r8.jar 裡的 D8 main class,prebuilts/r8/d8 shell script
#   #    在這個環境找不到 d8.jar,直接呼叫 com.android.tools.r8.D8 即可):
#   #    2026-08-19 修正:絕對不要加 --no-desugaring!之前的版本加了這個 flag,
#   #    結果任何真 Java lambda 語法(例如 `i -> ...`)在 API 26 下會被保留成
#   #    invoke-custom/invokedynamic + LambdaMetafactory,這跟原始 2019 年
#   #    dx/d8 build 出來的 `-$$Lambda$ClassName$hash` 合成類別模式(new-instance
#   #    + invoke-direct + invoke-interface)完全是不同的 bytecode 形狀,審查時
#   #    會誤判成邏輯錯誤。拿掉 --no-desugaring 後,現在這版 R8(8.9.5-dev)會把
#   #    真 lambda 桌化成 `ClassName$$ExternalSyntheticLambdaN` 合成類別,雖然類別
#   #    名稱字串跟原版的 hash 尾碼對不上(R8 版本較新,命名規則換了,這個沒辦法
#   #    重現,兩者都不在 PORTING_STATUS 追蹤範圍內),但呼叫端(new-instance +
#   #    invoke-direct + invoke-interface)的 bytecode 結構是對的,可以正確驗證
#   #    呼叫端邏輯。
#   find build_out -name "*.class" > class_files.txt
#   "$JAVA" -Xmx4G -cp /home/h/lineageos/prebuilts/r8/r8.jar com.android.tools.r8.D8 \
#       --output dex_out --lib "$ANDROID_JAR" --min-api 26 @class_files.txt
#   # 4) baksmali 轉回 smali（-l 很重要：改用 .locals 格式跟原版對齊，預設是
#   #    .registers 格式，兩者只是數字算法不同但會讓 diff 整個對不上）：
#   "$JAVA" -jar /home/h/lineageos/prebuilts/extract-tools/common/smali/baksmali.jar \
#       disassemble dex_out/classes.dex -o smali_out -a 26 -l
#
# 已知限制（很重要，下個 session 接手前要先看）：現在用的 D8（r8.jar，
# 8.9.5-dev）版本跟原始 APK 建置當時（約 2019 年）的 d8/dx 版本不同，會用
# 不同的指令選擇策略（例如小陣列初始化，原版用 new-array + 一串 aput-object，
# 現在的 D8 會優化成單一 filled-new-array + move-result-object）。這是編譯器
# 版本差異、不是邏輯錯誤，但會讓逐指令 diff 顯示「不同」。本工具已經把暫存器
# 編號、.line/.locals/.registers 這些非語意雜訊去掉，但沒辦法處理「同語意但
# 指令選擇不同」的案例——目前粗略估計只有約 15-20% 的 class 在正規化後逐字
# 相同，其餘大部分的「不同」在人工抽查後（例如 CameraSettingType，一個先前
# 已手刻驗證過、確定正確的 class）證實只是 filled-new-array 這類編譯器差異，
# 不代表邏輯有問題。所以「不同」不能直接當作「有 bug」，需要人工看 diff 內容
# 判斷是不是這種已知的良性差異；只有 SUMMARY 印出來的 identical 那組可以直接
# 當作驗證通過勾選 PORTING_STATUS.md。
#
# 2026-08-19 修正:LABEL_RE 原本開頭多了一個 `\b`(在字面 `:` 前面),但 `:`
# 是非文字字元,前面通常是空白/逗號也是非文字字元,`\b` 兩側都是非文字字元時
# 不會成立,導致這條 regex 從來沒 match 過任何東西,label 正規化整個是 no-op、
# 白費工。已經拿掉那個 `\b`,現在 :cond_N/:goto_N 等 label 才會真的被換成
# 統一的 ":L"。這表示在這次修正之前跑過的 SUMMARY ratio 數字都偏低(label
# 編號雜訊被誤判成不同),不影響已經勾選的 class(那些是人工逐行核對過的),
# 但之後看 ratio 時記得是修正後的數字才準。
#
# 2026-08-17 追加已知限制：目前這條 pipeline 重建出來的 smali_out 完全沒有
# androidx.annotation.Nullable/NonNull 的 .annotation build 區塊（用
# `grep -rl androidx/annotation/N smali_out_db/` 全部找不到任何一筆），但原版
# smali 幾乎每個欄位/參數/回傳值都有這些註解。這不是欄位遺漏或邏輯錯誤，是
# 目前 classpath 裡的 androidx.annotation jar 版本/retention policy 跟原始
# APK 建置當時不同，導致這些註解在 javac/D8 這一關就被整批拿掉，對所有 class
# 一視同仁（例如已經人工核對過完全正確的 databinding 套件 11 個檔案，逐行比對
# 邏輯 100% 一致，但 diff ratio 只有 0.6~0.7，字數少了將近一半，就是這個原因）。
# 遇到「新版整個檔案完全沒有 .annotation build」但其餘 opcode/常數/方法呼叫都
# 一致的情況，直接視為良性差異，不用當作 bug 追查。

import re, sys, os, collections, difflib

REPO = "/home/h/tmp/SemcCameraUI/App_smali/app-scan3d"
# java 分支已經清掉 smali/smali_classes2（java 分支不該有 smali 代碼），原版
# smali 現在只活在 smali-3.0.A.0.22-a9 分支。用一個常駐的 git worktree 取得，
# 不用每次臨時 checkout：
#   git -C REPO worktree add ../app-scan3d-smali-ref smali-3.0.A.0.22-a9
SMALI_REF_REPO = os.path.join(REPO, "..", "app-scan3d-smali-ref")
ORIG_DIRS = [os.path.join(SMALI_REF_REPO, "smali"), os.path.join(SMALI_REF_REPO, "smali_classes2")]
NEW_DIR = "/tmp/claude-1000/-home-h-tmp-SemcCameraUI/6a128863-fb52-4536-9125-07c5158f9a33/scratchpad/smali_out_s26"  # ephemeral，下次要重新產生後改這裡
STATUS_MD = os.path.join(REPO, "PORTING_STATUS.md")

REG_RE = re.compile(r'\b[vp]\d+\b')
LABEL_RE = re.compile(r':(?:goto|cond|try_start|try_end|catch|catchall|switch_data|array_data|sswitch_data|pswitch_data|sswitch|pswitch)_[A-Za-z0-9_]+\b')

def normalize(text):
    # Strip .line/.locals/.registers (register *count* differs legitimately
    # between compiler versions even for identical source) and blank/comment
    # lines. Register operands (v0, p1, ...) and local jump-target labels are
    # blanked out entirely rather than renamed: different D8/javac versions
    # allocate a genuinely different NUMBER of live registers for equivalent
    # code (e.g. reusing one register across a loop vs. a fresh one per
    # iteration), so even first-appearance-order renaming still produces
    # spurious mismatches. Comparing only opcodes + non-register operands
    # (constants, types, method/field refs, string literals) is a much more
    # reliable "same logic, different allocator" signal, at the cost of
    # missing bugs that are purely about register misuse (those would also
    # tend to show up as a genuine operand/opcode difference elsewhere).
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

def find_orig(relpath):
    for d in ORIG_DIRS:
        p = os.path.join(d, relpath)
        if os.path.isfile(p):
            return p
    return None

def parse_status():
    pkg = None
    groups = collections.OrderedDict()
    for line in open(STATUS_MD, encoding='utf-8'):
        m = re.match(r'^## (com\.sonymobile\.scan3d[\w.]*)( \(root\))? \(\d+\)', line)
        if m:
            pkg = m.group(1)
            continue
        m = re.match(r'^- \[( |x)\] `([^`]+)`', line)
        if m and pkg:
            checked = m.group(1) == 'x'
            name = m.group(2)
            base = name.split('$')[0]
            groups.setdefault((pkg, base), {'checked': [], 'names': []})
            groups[(pkg, base)]['checked'].append(checked)
            groups[(pkg, base)]['names'].append(name)
    return groups

def main():
    groups = parse_status()
    identical = []
    different = []
    missing_new = []
    missing_orig = []

    for (pkg, base), info in groups.items():
        pkg_path = pkg.replace('.', '/')
        # gather all smali names under this base (base + any $Inner)
        names = info['names']
        base_identical = True
        base_has_diff = False
        base_missing_new = False
        base_missing_orig = False
        diffs_detail = []
        for name in names:
            relpath = f"{pkg_path}/{name}.smali"
            new_path = os.path.join(NEW_DIR, relpath)
            orig_path = find_orig(relpath)
            if not os.path.isfile(new_path):
                base_missing_new = True
                continue
            if not orig_path:
                base_missing_orig = True
                continue
            new_lines = normalize(open(new_path, encoding='utf-8').read())
            orig_lines = normalize(open(orig_path, encoding='utf-8').read())
            if new_lines == orig_lines:
                continue
            else:
                base_has_diff = True
                sm = difflib.SequenceMatcher(None, orig_lines, new_lines)
                diffs_detail.append((name, sm.ratio(), len(orig_lines), len(new_lines)))

        if base_missing_new:
            missing_new.append((pkg, base))
        elif base_missing_orig:
            missing_orig.append((pkg, base))
        elif base_has_diff:
            different.append((pkg, base, diffs_detail))
        else:
            identical.append((pkg, base))

    print(f"=== SUMMARY ===")
    print(f"Total base classes tracked: {len(groups)}")
    print(f"Identical (after normalize): {len(identical)}")
    print(f"Different: {len(different)}")
    print(f"Missing in new (not compiled/renamed): {len(missing_new)}")
    print(f"Missing in orig (no matching smali found): {len(missing_orig)}")
    print()
    print("=== DIFFERENT (class, similarity ratios per file) ===")
    for pkg, base, details in different:
        detstr = ", ".join(f"{n}:{r:.3f}({ol}/{nl})" for n,r,ol,nl in details)
        print(f"{pkg}.{base}  ->  {detstr}")
    print()
    print("=== MISSING IN NEW (first 40) ===")
    for pkg, base in missing_new[:40]:
        print(f"{pkg}.{base}")
    print()
    print("=== MISSING IN ORIG (first 40) ===")
    for pkg, base in missing_orig[:40]:
        print(f"{pkg}.{base}")

if __name__ == '__main__':
    main()
