---
description: Tạo EF Core migration mới một cách an toàn
argument-hint: <TenMigration>
---

Tạo EF Core migration tên: **$ARGUMENTS**

## Các bước

1. **Kiểm tra thay đổi model**: xem diff các file trong `Infrastructure/Models/` để biết migration này sẽ chứa gì.

2. **Cảnh báo rủi ro**: nếu thay đổi có khả năng mất dữ liệu (xoá cột, đổi kiểu, đổi tên bảng), liệt kê rõ TRƯỚC khi tạo migration.

3. **Tạo migration**:
   ```
   dotnet ef migrations add $ARGUMENTS --project dotnet06_CybersoftMarketPlace.Infrastructure --startup-project dotnet06_CybersoftMarketPlace.Api
   ```

4. **Review file migration sinh ra**: đọc file Up()/Down() và tóm tắt các thay đổi schema cho tôi.

5. **KHÔNG tự chạy** `dotnet ef database update` — chỉ in lệnh ra và chờ tôi xác nhận.

Lưu ý: nếu model được scaffold database-first (không có thư mục Migrations), báo lại cho tôi thay vì tạo migration — cần thống nhất chuyển sang code-first trước.
