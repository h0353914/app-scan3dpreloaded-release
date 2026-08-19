#!/usr/bin/env python3
"""
掃描 debugRuntimeClasspath 完整依賴樹裡的每個 AAR，回報哪些帶有非空 res/ 資料夾
（這些就是需要改用 merge_resource_bearing_classes.py 處理成 classes-only jar 的依賴）。

用法：
    1. python3 -c "..." 或直接跑
       ./gradlew :app:dependencies --configuration debugRuntimeClasspath --console=plain \
           > /tmp/deps.txt
    2. python3 tools_diff/check_aar_resources.py /tmp/deps.txt
"""
import os
import re
import sys
import zipfile

CACHE_ROOT = os.path.expanduser("~/.gradle/caches/modules-2/files-2.1")


def parse_modules(deps_txt_path: str):
    seen = {}
    pattern = re.compile(r"([\w.\-]+):([\w.\-]+):([\w.\-]+)(?:\s*->\s*([\w.\-]+))?")
    with open(deps_txt_path) as f:
        for line in f:
            m = pattern.search(line)
            if not m:
                continue
            group, artifact, ver, newver = m.groups()
            seen[(group, artifact)] = newver or ver
    return sorted(f"{g}:{a}:{v}" for (g, a), v in seen.items())


def find_artifact(group: str, artifact: str, version: str):
    d = os.path.join(CACHE_ROOT, group, artifact, version)
    if not os.path.isdir(d):
        return None, None
    for hashdir in os.listdir(d):
        hd = os.path.join(d, hashdir)
        if not os.path.isdir(hd):
            continue
        for f in os.listdir(hd):
            if f.endswith(".aar"):
                return "AAR", os.path.join(hd, f)
            if f.endswith(".jar") and "sources" not in f and "javadoc" not in f:
                return "JAR", os.path.join(hd, f)
    return None, None


def main():
    if len(sys.argv) != 2:
        print(f"用法：{sys.argv[0]} <deps.txt>")
        sys.exit(1)

    modules = parse_modules(sys.argv[1])
    res_bearing = []
    for m in modules:
        g, a, v = m.split(":")
        typ, path = find_artifact(g, a, v)
        if typ != "AAR":
            continue
        with zipfile.ZipFile(path) as z:
            res_entries = [n for n in z.namelist() if n.startswith("res/") and not n.endswith("/")]
            total_size = sum(z.getinfo(n).file_size for n in res_entries)
        if total_size > 0:
            res_bearing.append((m, total_size, len(res_entries)))

    print(f"掃描 {len(modules)} 個模組，其中 {len(res_bearing)} 個帶有非空 res/：\n")
    for m, size, count in res_bearing:
        print(f"  {m}  ({count} 個檔案, {size} bytes)")


if __name__ == "__main__":
    main()
