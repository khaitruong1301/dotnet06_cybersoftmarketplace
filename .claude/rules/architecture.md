# Quy tắc kiến trúc

## Sơ đồ 4 tầng

```
dotnet06_CybersoftMarketPlace.Api            (REST API — Controllers, Program.cs, JWT, Swagger, Serilog)
        │ reference
        ▼
dotnet06_CybersoftMarketPlace.Application    (Business logic — Services, DTO, Helper, Constant)
        │ reference
        ▼
dotnet06_CybersoftMarketPlace.Infrastructure (Data access — Models/Entities, Repositories, UnitOfWork, DbContext)

dotnet06_CybersoftMarketPlace.Web            (Blazor UI — gọi API qua HTTP, KHÔNG reference Infrastructure)
```

## Luồng xử lý request chuẩn

```
Controller → Service → UnitOfWork → Repository → CybersoftMarketPlaceContext → SQL Server
```

## Quy tắc cứng (không có ngoại lệ)

1. **Controller không chứa business logic** — chỉ nhận request, gọi service, trả response.
2. **Controller/Service không truy cập DbContext trực tiếp** — mọi truy vấn đi qua UnitOfWork → Repository.
3. **Entity không rời khỏi tầng Application** — API chỉ trả DTO, map bằng AutoMapper.
4. **Không reference ngược chiều** — Infrastructure không biết Application, Application không biết Api.
5. **Web chỉ nói chuyện với Api qua HTTP** — không gọi thẳng Service hay DbContext.
6. **Response API thống nhất** qua `HTTPResponseData` (Application/DTO).
7. **Đăng ký DI tập trung** trong `Program.cs` của Api.
