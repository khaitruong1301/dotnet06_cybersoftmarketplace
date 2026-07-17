---
description: Review các thay đổi hiện tại (diff) theo checklist của dự án
allowed-tools: Bash(git diff*), Bash(git status), Bash(git log*), Read, Grep, Glob, Agent
---

Review toàn bộ thay đổi chưa commit trong working tree:

1. Chạy `git status` và `git diff` để lấy danh sách thay đổi (bỏ qua các file trong `bin/`, `obj/`).
2. Dùng agent **code-reviewer** (.claude/agents/code-reviewer.md) để review theo checklist dự án: kiến trúc 4 tầng, bảo mật, async, EF Core, quy ước đặt tên.
3. Tổng hợp kết quả theo mức độ: Critical → Warning → Suggestion.
4. Chỉ báo cáo, KHÔNG tự sửa — chờ tôi quyết định sửa gì.
