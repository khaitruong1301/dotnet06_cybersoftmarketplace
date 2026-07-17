# Quy ước code

## Đặt tên

- Class, method, property: `PascalCase`
- Biến local, tham số: `camelCase`
- Interface: tiền tố `I` (vd `IRepositoryBase`)
- Method async: hậu tố `Async` (vd `RegisterUserAsync`)
- DTO: hậu tố `DTO` (vd `UserRegisterDTO`), đặt trong `Application/DTO/`
- Repository: hậu tố `Repository`, đặt trong `Infrastructure/Repositories/`
- Service: hậu tố `Service`, đặt trong `Application/Services/`

## Async

- Mọi thao tác I/O (database, HTTP) phải async — dùng `await`, không dùng `.Result` hay `.Wait()`
- Không viết `async void` (trừ event handler)

## Nullable

- Dự án bật `<Nullable>enable</Nullable>` — xử lý warning nullable nghiêm túc, không suppress bằng `!` bừa bãi

## EF Core

- Navigation property phải `virtual` (dự án dùng lazy loading proxies)
- Cẩn thận N+1 khi lặp collection — dùng `Include()` khi biết trước sẽ cần navigation data
- Query chỉ đọc: cân nhắc `AsNoTracking()`

## Bảo mật

- Password: hash bằng BCrypt (`BCrypt.Net-Next`), không bao giờ lưu plaintext
- Secret (JWT key, connection string): chỉ trong appsettings/environment, không hardcode
- Không log token/password qua Serilog

## Swagger

- Action public phải có `/// <summary>` — dự án bật `GenerateDocumentationFile` để Swagger đọc

## Git

- KHÔNG commit `bin/`, `obj/` (nếu chưa có .gitignore chuẩn, đề xuất thêm)
- Commit message: tiếng Việt hoặc tiếng Anh đều được, mô tả rõ thay đổi
