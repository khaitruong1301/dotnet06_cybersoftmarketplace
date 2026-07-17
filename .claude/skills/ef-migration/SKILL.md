---
name: ef-migration
description: Quy trình thay đổi schema database an toàn với EF Core cho CybersoftMarketPlace — sửa model, tạo migration, review SQL, cập nhật database. Dùng khi cần thêm bảng, thêm cột, đổi quan hệ, hoặc bất kỳ thay đổi schema nào.
---

# Quy trình EF Core migration an toàn

DbContext: `CybersoftMarketPlaceContext` (Infrastructure/Models). Connection string trong `appsettings.json` của Infrastructure. Startup project là Api.

## Bước 1 — Xác định hiện trạng

- Kiểm tra thư mục `Migrations/` có tồn tại trong Infrastructure không:
  - **Có** → dự án đang code-first, tiếp tục bình thường
  - **Không** → dự án đang database-first (scaffold). DỪNG LẠI, báo người dùng: thay đổi schema phải làm trực tiếp trên SQL Server rồi scaffold lại, hoặc thống nhất chuyển sang code-first

## Bước 2 — Sửa model

- Sửa entity trong `Models/` + cấu hình trong `CybersoftMarketPlaceContext`
- Navigation property phải `virtual` (lazy loading proxies)
- Quan hệ mới: khai báo rõ FK, cascade behavior trong `OnModelCreating`

## Bước 3 — Tạo migration

```bash
dotnet ef migrations add <TenMigration> \
  --project dotnet06_CybersoftMarketPlace.Infrastructure \
  --startup-project dotnet06_CybersoftMarketPlace.Api
```

Tên migration: PascalCase, mô tả thay đổi (vd `AddProductDiscountColumn`).

## Bước 4 — Review bắt buộc trước khi apply

- Đọc file migration sinh ra (cả `Up()` và `Down()`)
- Cảnh báo nếu có: `DropColumn`, `DropTable`, `AlterColumn` đổi kiểu — các thao tác này có thể mất dữ liệu
- Có thể xem trước SQL: `dotnet ef migrations script --project ... --startup-project ...`

## Bước 5 — Apply (chỉ khi người dùng xác nhận)

```bash
dotnet ef database update \
  --project dotnet06_CybersoftMarketPlace.Infrastructure \
  --startup-project dotnet06_CybersoftMarketPlace.Api
```

TUYỆT ĐỐI không tự chạy lệnh này khi migration có thao tác phá huỷ dữ liệu — luôn hỏi trước.

## Bước 6 — Kiểm chứng

- `dotnet build` sạch
- Chạy API, gọi thử một endpoint đọc dữ liệu từ bảng bị ảnh hưởng
