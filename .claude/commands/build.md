---
description: Build toàn bộ solution và báo cáo lỗi/warning
allowed-tools: Bash(dotnet build*), Read, Grep
---

Build toàn bộ solution CybersoftMarketPlace:

1. Chạy `dotnet build` từ thư mục gốc dự án.
2. Nếu build **thành công**: báo ngắn gọn số warning (nếu có) và dừng.
3. Nếu build **thất bại**:
   - Liệt kê từng lỗi theo format: file:dòng — mã lỗi — mô tả
   - Đọc file liên quan để hiểu ngữ cảnh
   - Đề xuất cách sửa cho từng lỗi (chưa sửa vội, chờ xác nhận trừ khi lỗi hiển nhiên như thiếu using)
