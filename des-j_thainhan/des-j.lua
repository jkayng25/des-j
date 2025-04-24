local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "des-j Hub - Blox Fruits",  -- Tên GUI
    LoadingTitle = "Đang tải des-j...",  -- Chữ hiện ra khi tải
    ConfigurationSaving = {
       Enabled = true,  -- Lưu cấu hình
       FolderName = "des-j"  -- Lưu trong thư mục 'des-j'
    }
})

local MainTab = Window:CreateTab("Auto Farm", 4483362458)  -- Tạo Tab "Auto Farm"

-- Thêm Toggle cho tính năng Auto Farm Level
MainTab:CreateToggle({
   Name = "Auto Farm Level",  -- Tên tính năng
   CurrentValue = false,  -- Mặc định là không bật
   Callback = function(Value)
       _G.AutoFarm = Value  -- Lưu giá trị toggle vào biến toàn cục
       
       if _G.AutoFarm then
           -- Khi bật Auto Farm
           spawn(function()  -- Dùng spawn để chạy song song và không gây lag GUI
               while _G.AutoFarm do
                   task.wait(1)  -- Sử dụng task.wait để tối ưu thời gian chờ
                   print("Đang farm level...")  -- Thực hiện hàm farm thực tế ở đây
                   -- Thêm mã farm thực tế vào đây, ví dụ như di chuyển và đánh quái.
               end
           end)
       end
   end
})

-- Nút dừng Auto Farm
MainTab:CreateButton({
    Name = "Stop Auto Farm",  -- Nút để dừng Auto Farm
    Callback = function()
        _G.AutoFarm = false  -- Tắt Auto Farm
        print("Đã dừng Auto Farm!")
    end
})

-- Thêm Toggle cho tính năng Auto Collect Fruits
MainTab:CreateToggle({
   Name = "Auto Collect Fruits",  -- Tên tính năng
   CurrentValue = false,  -- Mặc định là không bật
   Callback = function(Value)
       _G.AutoCollect = Value  -- Lưu giá trị toggle vào biến toàn cục

       if _G.AutoCollect then
           -- Khi bật Auto Collect Fruits
           spawn(function()  -- Dùng spawn để chạy song song
               while _G.AutoCollect do
                   task.wait(2)  -- Sử dụng task.wait để giảm tần suất kiểm tra
                   print("Đang thu thập trái ác quỷ...")  -- Thực hiện hàm thu thập trái ác quỷ
                   -- Thêm mã thu thập trái ác quỷ ở đây, ví dụ như kiểm tra quanh map và nhặt trái.
               end
           end)
       end
   end
})

-- Nút dừng Auto Collect Fruits
MainTab:CreateButton({
    Name = "Stop Auto Collect",  -- Nút để dừng Auto Collect Fruits
    Callback = function()
        _G.AutoCollect = false  -- Tắt Auto Collect Fruits
        print("Đã dừng thu thập trái ác quỷ!")
    end
})
