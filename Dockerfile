FROM python:3.11-alpine
RUN apk add --no-cache bash
WORKDIR /app
COPY . .
RUN chmod +x log_analyzer.sh
RUN python3 logs_generator.py
CMD ["./log_analyzer.sh"]