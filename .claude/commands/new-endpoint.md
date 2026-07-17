---
description: Tạo REST endpoint mới xuyên 4 tầng (Controller → Service → UnitOfWork → Repository)
argument-hint: <tên-resource> <mô-tả-chức-năng>
---

Tạo endpoint mới cho resource: **$ARGUMENTS**

Làm theo đúng kiến trúc 4 tầng của dự án (xem CLAUDE.md và .claude/rules/architecture.md):

## Các bước

1. **Khảo sát trước**: đọc `UserController.cs`, `UserService.cs`, `UserRepository.cs` để nắm pattern hiện tại — code mới phải giống hệt phong cách này.

2. **DTO** (`dotnet06_CybersoftMarketPlace.Application/DTO/`):
   - Tạo request DTO và/hoặc response DTO cho resource
   - KHÔNG dùng entity trực tiếp làm DTO

3. **Service** (`dotnet06_CybersoftMarketPlace.Application/Services/`):
   - Tạo/mở rộng service với method async (hậu tố `Async`)
   - Truy cập dữ liệu qua UnitOfWork, map entity ↔ DTO bằng AutoMapper
   - Trả về `HTTPResponseData`

4. **Repository** (nếu cần method truy vấn mới): thêm vào repository tương ứng trong `dotnet06_CybersoftMarketPlace.Infrastructure/Repositories/`

5. **Controller** (`dotnet06_CybersoftMarketPlace.Api/Controllers/`):
   - Action có `/// <summary>` cho Swagger
   - Đúng HTTP verb và status code
   - Thêm `[Authorize]` nếu endpoint cần đăng nhập

6. **Đăng ký DI**: nếu tạo service/repository mới, đăng ký trong `Program.cs` của Api.

7. **Kiểm chứng**: chạy `dotnet build` — phải build sạch mới được coi là xong.
