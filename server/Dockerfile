# Sử dụng image Python 3.8 làm base
FROM python:3.8

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy file requirements.txt để cài đặt các thư viện Python cần thiết
COPY requirements.txt .

# Cài đặt thư viện từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ mã nguồn vào container
COPY . .

# Mở cổng 8000 cho ứng dụng
EXPOSE 8000

# Lệnh khởi chạy ứng dụng FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
