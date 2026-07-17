# CybersoftMarketPlace

Dự án marketplace (kiểu Shopee) — khoá học .NET 06 của Cybersoft. Solution gồm 4 project, .NET 10, SQL Server.

## Cấu trúc solution

| Project | Vai trò |
|---------|---------|
| `dotnet06_CybersoftMarketPlace.Api` | REST API — Controllers, JWT, Swagger, Serilog, Redis cache |
| `dotnet06_CybersoftMarketPlace.Application` | Business logic — Services, DTO, Helper, Constant |
| `dotnet06_CybersoftMarketPlace.Infrastructure` | Data access — Entities (Models), Repositories, UnitOfWork, `CybersoftMarketPlaceContext` |
| `dotnet06_CybersoftMarketPlace.Web` | UI Blazor — Pages, Shared components |

## Lệnh thường dùng

```bash
dotnet build                                              # build toàn bộ solution
dotnet run --project dotnet06_CybersoftMarketPlace.Api    # chạy API (Swagger tại /swagger)
dotnet run --project dotnet06_CybersoftMarketPlace.Web    # chạy Blazor Web
```

## Quy tắc bắt buộc

Luồng xử lý: `Controller → Service → UnitOfWork → Repository → DbContext`. Chi tiết:

- @.claude/rules/architecture.md
- @.claude/rules/coding-conventions.md

Tóm tắt nhanh:
- Controller không chứa business logic, không đụng DbContext
- API chỉ trả DTO (map bằng AutoMapper), bọc trong `HTTPResponseData` — không trả entity
- Method async có hậu tố `Async`; không dùng `.Result`/`.Wait()`
- Navigation property phải `virtual` (EF Core lazy loading proxies)
- Password hash bằng BCrypt; secret chỉ nằm trong appsettings
- Service/Repository mới phải đăng ký DI trong `Program.cs` của Api

## Mẫu chuẩn để tham khảo khi viết code mới

Chuỗi `User*` là mẫu hoàn chỉnh: [UserController.cs](dotnet06_CybersoftMarketPlace.Api/Controllers/UserController.cs) → [UserService.cs](dotnet06_CybersoftMarketPlace.Application/Services/UserService.cs) → [UserRepository.cs](dotnet06_CybersoftMarketPlace.Infrastructure/Repositories/UserRepository.cs) → [UnitOfwork.cs](dotnet06_CybersoftMarketPlace.Infrastructure/Unitofwork/UnitOfwork.cs)

## Lưu ý

- KHÔNG commit `bin/`, `obj/`
- KHÔNG tự chạy `dotnet ef database update` — luôn hỏi trước
- Các entity view (`VGetAllProductsDetail`...) là read-only
