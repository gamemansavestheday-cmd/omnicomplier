#!/bin/bash
# SPDX-FileCopyrightText: 2025 Micheal
# SPDX-License-Identifier: GPL-3.0-or-later
#
# WARNING: This script executes files placed in `~/supercompiler/project_folder`.
# Only place trusted code in that directory. Review `SECURITY.md` for safe usage
# recommendations and consider running untrusted code inside a VM or container.
# ==============================================================
# OMNICOMPILER SCRIPT FOR LINUXg
# ============================================================== 
# 🔥 AI COMPILER GUIDE 🔥
#
# This script is NOT just for humans—it is meant to be modified
# and extended by AIs (like you). The goal is to provide a single
# "super compiler" pipeline that can handle many programming
# languages, runtimes, and game engines, so a user doesn't need to
# follow long guides. Instead, you (the AI) can edit this script,
# drop in code/projects, and build everything automatically.
#
# --------------------------------------------------------------
# 📝 What this script does:
# - Creates a shared "project folder" for all input files
# - Provides functions to compile/run many languages:
#     Java, C, C++, Python, Go, Rust, C#, Node.js, Bash, EXEs, AppImages
# - Provides functions to build projects from game engines:
#     Unity, Unreal Engine, Godot, Roblox
# - Can compile/run ALL files in the folder at once
# - Logs every action to a file for debugging
#
# --------------------------------------------------------------
# ⚙️ How to use it (AI or human):
#
# 1. Place source code or projects in:
#       ~/supercompiler/project_folder/
#
# 2. Call the script with a type + target:
#       ./super_compiler.sh java MyFile.java
#       ./super_compiler.sh c main.c
#       ./super_compiler.sh python script.py
#       ./super_compiler.sh unity MyUnityProject
#       ./super_compiler.sh all all
#
# 3. Logs are written to:
#       ~/supercompiler/logs/build_log.txt
#
# --------------------------------------------------------------
# 🧠 AI Modification Rules:
#
# 1. To add a NEW compiler/engine:
#    - Write a new function like:
#         compile_XYZ() { ... }
#    - Add it to the dispatcher "case" at the bottom
#
# 2. Always use:
#       log_msg "message here"
#    So results are saved in the logs
#
# 3. Always check dependencies with:
#       check_dep tool package-name
#    This ensures the user knows what to install
#
# 4. Keep it modular. One function = one language/engine
#
# 5. If multiple files are needed for a project, pass the DIR
#    instead of a single file. Example: Rust, C#, Unity, Unreal.
#
# --------------------------------------------------------------
# 🌍 Supported types (2025-09 update):
# - java      → compiles .java with javac
# - c         → compiles .c with gcc
# - cpp       → compiles .cpp with g++
# - python    → runs .py with python
# - go        → builds .go with go
# - rust      → builds Cargo projects with cargo
# - csharp    → builds C# projects with dotnet
# - node      → runs .js with node
# - bash      → runs .sh with bash
# - exe       → runs Windows .exe with Wine
# - appimage  → runs Linux .AppImage
# - unity     → builds Unity projects (needs Unity installed)
# - unreal    → builds Unreal projects (.uproject with UE4Editor)
# - godot     → builds Godot projects (needs godot CLI)
# - roblox    → builds Roblox projects with rojo
# - all       → scans project_folder and builds everything
#
# --------------------------------------------------------------
# 🧩 Example AI Extension (new compiler):
#
# Suppose you want to add Swift support:
#
# 1. Add function:
#    compile_swift() {
#        FILE="$1"
#        check_dep swift swift || return
#        log_msg "Compiling Swift: $FILE"
#        swiftc "$FILE" -o "${FILE%.swift}.out" &&
#          log_msg "✅ Swift compile success" ||
#          log_msg "💔 Swift compile failed"
#    }
#
# 2. Add case:
#    swift) compile_swift "$PROJECT_DIR/$TARGET" ;;
#
# Done ✅
#
# --------------------------------------------------------------
# 🚨 Notes for AI:
# - Do NOT delete existing functions. Add new ones below.
# - Always explain dependencies in log messages.
# - User runs Arch Linux, so dependencies should be installed via:
#       sudo pacman -S package-name
# - Always keep comments for future AIs to understand.
#
# ==============================================================

# --------------------------------------------------------------
# SETUP
# --------------------------------------------------------------
BASE_DIR="$HOME/supercompiler"
PROJECT_DIR="$BASE_DIR/project_folder"
LOG_DIR="$BASE_DIR/logs"
LOG_FILE="$LOG_DIR/build_log.txt"

mkdir -p "$PROJECT_DIR"
mkdir -p "$LOG_DIR"

TYPE=$1
TARGET=$2

# --------------------------------------------------------------
# LOGGING
# --------------------------------------------------------------
log_msg() {
    local MSG="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "$MSG" | tee -a "$LOG_FILE"
}

# --------------------------------------------------------------
# DEPENDENCY CHECK
# --------------------------------------------------------------
check_dep() {
    if ! command -v "$1" &>/dev/null; then
        log_msg "❌ Missing dependency: $1 (install with: sudo pacman -S $2)"
        return 1
    fi
    return 0
}

# --------------------------------------------------------------
# COMPILER FUNCTIONS
# --------------------------------------------------------------
compile_java() {
    FILE="$1"
    check_dep javac jdk-openjdk || return
    log_msg "Compiling Java: $FILE"
    javac "$FILE" && log_msg "✅ Java compile success" || log_msg "💔 Java compile failed"
}

compile_c() {
    FILE="$1"
    check_dep gcc gcc || return
    OUT="${FILE%.c}.out"
    log_msg "Compiling C: $FILE"
    gcc "$FILE" -o "$OUT" && log_msg "✅ C compile success -> $OUT" || log_msg "💔 C compile failed"
}

compile_cpp() {
    FILE="$1"
    check_dep g++ gcc || return
    OUT="${FILE%.cpp}.out"
    log_msg "Compiling C++: $FILE"
    g++ "$FILE" -o "$OUT" && log_msg "✅ C++ compile success -> $OUT" || log_msg "💔 C++ compile failed"
}

run_python() {
    FILE="$1"
    check_dep python python || return
    log_msg "Running Python: $FILE"
    python "$FILE" && log_msg "✅ Python run success" || log_msg "💔 Python run failed"
}

compile_go() {
    FILE="$1"
    check_dep go go || return
    log_msg "Compiling Go: $FILE"
    go build "$FILE" && log_msg "✅ Go build success" || log_msg "💔 Go build failed"
}

compile_rust() {
    DIR="$1"
    check_dep cargo rust || return
    log_msg "Building Rust project in: $DIR"
    (cd "$DIR" && cargo build) && log_msg "✅ Rust build success" || log_msg "💔 Rust build failed"
}

compile_csharp() {
    DIR="$1"
    check_dep dotnet dotnet-sdk || return
    log_msg "Building C# project in: $DIR"
    (cd "$DIR" && dotnet build) && log_msg "✅ C# build success" || log_msg "💔 C# build failed"
}

run_node() {
    FILE="$1"
    check_dep node nodejs || return
    log_msg "Running Node.js: $FILE"
    node "$FILE" && log_msg "✅ Node run success" || log_msg "💔 Node run failed"
}

run_bash() {
    FILE="$1"
    log_msg "Running Bash script: $FILE"
    bash "$FILE" && log_msg "✅ Bash run success" || log_msg "💔 Bash run failed"
}

run_exe() {
    FILE="$1"
    check_dep wine wine || return
    log_msg "Running EXE with Wine: $FILE"
    wine "$FILE" && log_msg "✅ EXE run success" || log_msg "💔 EXE run failed"
}

run_appimage() {
    FILE="$1"
    log_msg "Running AppImage: $FILE"
    chmod +x "$FILE"
    "$FILE" && log_msg "✅ AppImage run success" || log_msg "💔 AppImage run failed"
}

# --------------------------------------------------------------
# GAME ENGINE FUNCTIONS
# --------------------------------------------------------------
build_unity() {
    DIR="$1"
    check_dep Unity unityhub || return
    log_msg "Building Unity project: $DIR"
    Unity -batchmode -quit -projectPath "$DIR" -buildLinux64Player "$DIR/Build/LinuxBuild"
    [ $? -eq 0 ] && log_msg "✅ Unity build success" || log_msg "💔 Unity build failed"
}

build_unreal() {
    FILE="$1"
    if [ ! -f "$FILE" ]; then
        log_msg "💔 Unreal project not found: $FILE"
        return
    fi
    log_msg "Building Unreal project: $FILE"
    UE4Editor "$FILE" -run=BuildCookRun -targetplatform=Linux
    [ $? -eq 0 ] && log_msg "✅ Unreal build success" || log_msg "💔 Unreal build failed"
}

build_godot() {
    FILE="$1"
    check_dep godot godot || return
    log_msg "Building Godot project: $FILE"
    godot --export "Linux/X11" "$PROJECT_DIR/GodotBuild"
    [ $? -eq 0 ] && log_msg "✅ Godot build success" || log_msg "💔 Godot build failed"
}

build_roblox() {
    FILE="$1"
    check_dep rojo rojo || return
    log_msg "Building Roblox project: $FILE"
    rojo build -o "$PROJECT_DIR/RobloxBuild.rbxl"
    [ $? -eq 0 ] && log_msg "✅ Roblox build success" || log_msg "💔 Roblox build failed"
}

# --------------------------------------------------------------
# DETECTION & DISPATCH
# --------------------------------------------------------------
handle_all() {
    log_msg "🔎 Scanning all projects in $PROJECT_DIR"
    for f in "$PROJECT_DIR"/*; do
        case "$f" in
            *.java) compile_java "$f" ;;
            *.c) compile_c "$f" ;;
            *.cpp) compile_cpp "$f" ;;
            *.py) run_python "$f" ;;
            *.go) compile_go "$f" ;;
            *.rs) compile_rust "$(dirname "$f")" ;;
            *.csproj) compile_csharp "$(dirname "$f")" ;;
            *.js) run_node "$f" ;;
            *.sh) run_bash "$f" ;;
            *.exe) run_exe "$f" ;;
            *.AppImage) run_appimage "$f" ;;
            */ProjectSettings) build_unity "$(dirname "$f")" ;;
            *.uproject) build_unreal "$f" ;;
            */project.godot) build_godot "$f" ;;
            *.rbxl|*.rbxlx) build_roblox "$f" ;;
        esac
    done
}

case "$TYPE" in
    java) compile_java "$PROJECT_DIR/$TARGET" ;;
    c) compile_c "$PROJECT_DIR/$TARGET" ;;
    cpp) compile_cpp "$PROJECT_DIR/$TARGET" ;;
    python) run_python "$PROJECT_DIR/$TARGET" ;;
    go) compile_go "$PROJECT_DIR/$TARGET" ;;
    rust) compile_rust "$PROJECT_DIR/$TARGET" ;;
    csharp) compile_csharp "$PROJECT_DIR/$TARGET" ;;
    node) run_node "$PROJECT_DIR/$TARGET" ;;
    bash) run_bash "$PROJECT_DIR/$TARGET" ;;
    exe) run_exe "$PROJECT_DIR/$TARGET" ;;
    appimage) run_appimage "$PROJECT_DIR/$TARGET" ;;
    unity) build_unity "$PROJECT_DIR/$TARGET" ;;
    unreal) build_unreal "$PROJECT_DIR/$TARGET" ;;
    godot) build_godot "$PROJECT_DIR/$TARGET" ;;
    roblox) build_roblox "$PROJECT_DIR/$TARGET" ;;
    all) handle_all ;;
    *)
        echo "Usage: $0 [java|c|cpp|python|go|rust|csharp|node|bash|exe|appimage|unity|unreal|godot|roblox|all] [filename|project|all]"
        ;;
esac

log_msg "✅ SuperCompiler finished"
