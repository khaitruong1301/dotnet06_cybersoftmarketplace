---
description: Tạo repository mới theo pattern IRepositoryBase và đăng ký vào UnitOfWork
argument-hint: <tên-entity>
---

Tạo repository mới cho entity: **$ARGUMENTS**

## Các bước

1. **Khảo sát pattern hiện tại**:
   - Đọc `dotnet06_CybersoftMarketPlace.Infrastructure/Repositories/IRepositoryBase.cs`
   - Đọc một repository mẫu (vd `UserRepository.cs`) để nắm cấu trúc

2. **Kiểm tra entity tồn tại**: xác nhận `$ARGUMENTS` có trong `Infrastructure/Models/`. Nếu chưa có, dừng lại và hỏi.

3. **Tạo repository**: `dotnet06_CybersoftMarketPlace.Infrastructure/Repositories/$ARGUMENTS + "Repository.cs"` — kế thừa đúng pattern của các repository hiện có.

4. **Đăng ký vào UnitOfWork**: mở `dotnet06_CybersoftMarketPlace.Infrastructure/Unitofwork/UnitOfwork.cs`, thêm property cho repository mới theo đúng cách các repository khác được khai báo.

5. **Đăng ký DI** (nếu dự án đăng ký repository riêng lẻ trong `Program.cs`): thêm tương tự.

6. **Kiểm chứng**: `dotnet build` phải sạch.
