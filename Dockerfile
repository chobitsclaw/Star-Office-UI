FROM python:3.11-slim

WORKDIR /app

# 安装依赖
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制代码
COPY backend/ ./backend/
COPY frontend/ ./frontend/
COPY state.sample.json ./state.json
COPY set_state.py .
COPY join-keys.json .

EXPOSE 18791

CMD ["python3", "backend/app.py"]