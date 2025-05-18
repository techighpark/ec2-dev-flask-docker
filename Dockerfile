# 베이스 이미지: 가볍고 공식적인 Python 이미지 사용
FROM python:3.10-slim

# 컨테이너 내 작업 디렉토리 설정
WORKDIR /app

# requirements 복사 후 설치
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 앱 소스 복사
COPY . .

# Gunicorn으로 앱 실행
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]


