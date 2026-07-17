---
description: Chạy API và kiểm tra Swagger hoạt động
allowed-tools: Bash
---

Chạy project API của CybersoftMarketPlace:

1. Build trước để chắc chắn không lỗi compile: `dotnet build dotnet06_CybersoftMarketPlace.Api`
2. Chạy API ở chế độ background: `dotnet run --project dotnet06_CybersoftMarketPlace.Api`
3. Đọc output để lấy URL (thường là `http://localhost:5xxx`) và xác nhận API đã khởi động thành công.
4. Kiểm tra Swagger có hoạt động: gọi `curl` tới `/swagger/v1/swagger.json`.
5. Báo cho tôi biết: URL của API, URL Swagger UI, và trạng thái khởi động (kèm lỗi nếu có).

Lưu ý: nếu port bị chiếm, tìm process đang giữ port và báo lại, đừng tự kill.
