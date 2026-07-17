---
name: new-feature
description: Quy trình thêm feature hoàn chỉnh xuyên 4 tầng cho CybersoftMarketPlace — từ entity/repository đến service, controller và Blazor page. Dùng khi người dùng yêu cầu thêm chức năng mới (vd "thêm chức năng quản lý giỏ hàng", "làm feature đánh giá sản phẩm").
---

# Quy trình thêm feature mới

Feature hoàn chỉnh đi qua 4 tầng theo thứ tự dưới đây. Luôn khảo sát code hiện có (User* là chuỗi mẫu chuẩn: `UserController` → `UserService` → `UserRepository`) trước khi viết code mới.

## Bước 1 — Phân tích yêu cầu

- Xác định các entity liên quan (đã có trong `Infrastructure/Models/` chưa?)
- Liệt kê các endpoint cần thiết (verb, route, auth)
- Xác định DTO request/response cho từng endpoint
- Trình bày kế hoạch ngắn gọn cho người dùng TRƯỚC khi code nếu feature lớn (>3 endpoint)

## Bước 2 — Tầng Infrastructure

- Nếu cần entity mới: thêm vào `Models/` + cập nhật `CybersoftMarketPlaceContext` (nhớ navigation property phải `virtual` vì dùng lazy loading proxies)
- Tạo repository theo pattern `IRepositoryBase` (tham khảo lệnh /new-repository)
- Đăng ký repository vào `Unitofwork/UnitOfwork.cs`

## Bước 3 — Tầng Application

- Tạo DTO trong `DTO/` (request và response tách riêng)
- Tạo service trong `Services/`: method async, gọi UnitOfWork, map bằng AutoMapper, trả `HTTPResponseData`
- Business logic đặt hết ở đây — không để lọt lên Controller

## Bước 4 — Tầng Api

- Tạo controller: XML summary cho Swagger, đúng status code, `[Authorize]` nếu cần
- Đăng ký service mới vào DI trong `Program.cs`

## Bước 5 — Tầng Web (nếu feature có UI)

- Tạo Blazor page trong `dotnet06_CybersoftMarketPlace.Web/Pages/`
- Component dùng chung đặt trong `Shared/`
- Gọi API qua HttpClient, không truy cập DbContext trực tiếp từ Web

## Bước 6 — Kiểm chứng

- `dotnet build` phải sạch (0 error)
- Chạy API, gọi thử endpoint mới qua curl hoặc file `.http`
- Tóm tắt các file đã tạo/sửa cho người dùng
