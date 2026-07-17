#!/bin/bash
# Hook mẫu: build nhanh solution sau khi Claude sửa file .cs
# Wire vào PostToolUse (matcher: Edit|Write) trong settings.json — xem README.md cùng thư mục

# Đọc input JSON từ stdin (Claude Code truyền thông tin tool call vào đây)
INPUT=$(cat)

# Chỉ build khi file bị sửa là file C#
FILE_PATH=$(echo "$INPUT" | grep -o '"file_path"[^,}]*' | head -1)
case "$FILE_PATH" in
  *.cs*)
    cd "$CLAUDE_PROJECT_DIR" || exit 0
    OUTPUT=$(dotnet build --nologo -v q 2>&1)
    if [ $? -ne 0 ]; then
      # Exit code 2 = báo lỗi ngược lại cho Claude xử lý
      echo "Build failed sau khi sửa file:" >&2
      echo "$OUTPUT" | grep -E "error" >&2
      exit 2
    fi
    ;;
esac

exit 0
