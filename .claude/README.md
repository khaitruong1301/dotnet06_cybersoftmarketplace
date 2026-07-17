# Cấu trúc thư mục .claude

Thư mục cấu hình Claude Code cho dự án **CybersoftMarketPlace** (.NET 10).

```
.claude/
├── settings.json        # Permissions + cấu hình chung (commit vào git, dùng chung cho team)
├── settings.local.json  # Cấu hình cá nhân (KHÔNG commit — tự tạo nếu cần)
├── agents/              # Subagents chuyên biệt (gọi qua Agent tool hoặc tự động)
│   ├── code-reviewer.md #   Review code theo checklist của dự án
│   ├── api-designer.md  #   Thiết kế REST endpoint theo kiến trúc 4 tầng
│   └── db-expert.md     #   Chuyên gia EF Core / SQL Server / migration
├── commands/            # Slash commands (gõ /<tên-file> trong Claude Code)
│   ├── build.md         #   /build          — build solution, báo lỗi
│   ├── run-api.md       #   /run-api        — chạy API + mở Swagger
│   ├── new-endpoint.md  #   /new-endpoint   — tạo endpoint mới xuyên 4 tầng
│   ├── new-repository.md#   /new-repository — tạo repository + đăng ký UnitOfWork
│   ├── migration.md     #   /migration      — tạo EF Core migration
│   └── review.md        #   /review         — review diff hiện tại
├── skills/              # Skills — quy trình nhiều bước (mỗi skill 1 folder chứa SKILL.md)
│   ├── new-feature/     #   Quy trình thêm feature hoàn chỉnh xuyên 4 tầng
│   └── ef-migration/    #   Quy trình migration database an toàn
├── hooks/               # Scripts cho hooks (wire trong settings.json — xem hooks/README.md)
│   └── check-build.sh   #   Ví dụ: kiểm tra build sau khi sửa file .cs
└── rules/               # Quy tắc dự án (được import vào CLAUDE.md gốc bằng @)
    ├── architecture.md  #   Quy tắc kiến trúc 4 tầng, luồng phụ thuộc
    └── coding-conventions.md # Quy ước đặt tên, DTO, async, error handling
```

## Ghi chú

- `CLAUDE.md` nằm ở **thư mục gốc dự án** (không phải trong `.claude/`) — được nạp tự động mỗi session.
- File trong `commands/` nhận tham số qua `$ARGUMENTS`, ví dụ: `/new-endpoint Product`.
- File trong `agents/` có frontmatter `name`, `description`, `tools` — Claude tự chọn agent phù hợp theo `description`.
- `settings.local.json` dành cho cấu hình cá nhân (đã được Claude Code tự thêm vào .gitignore).
