# Hooks

Thư mục chứa script cho hooks của Claude Code. Hook là lệnh shell được harness **tự động chạy** tại các thời điểm nhất định (trước/sau tool call, khi Claude dừng...) — cấu hình trong `settings.json`.

## Script có sẵn

- `check-build.sh` — build nhanh solution, dùng làm hook sau khi Claude sửa file `.cs`

## Cách kích hoạt (ví dụ)

Thêm block `hooks` vào `.claude/settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/check-build.sh"
          }
        ]
      }
    ]
  }
}
```

## Các loại hook hay dùng

| Hook | Thời điểm chạy |
|------|----------------|
| `PreToolUse` | Trước khi tool chạy (có thể chặn) |
| `PostToolUse` | Sau khi tool chạy xong |
| `UserPromptSubmit` | Khi người dùng gửi prompt |
| `Stop` | Khi Claude kết thúc lượt trả lời |

Mặc định chưa wire hook nào để tránh làm chậm thao tác — bật khi team thấy cần.
