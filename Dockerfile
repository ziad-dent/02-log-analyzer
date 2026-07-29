FROM python:3.11-alpine

# تثبيت الباش داخل Alpine
RUN apk add --no-cache bash

WORKDIR /app

# كمل بقية الخطوات...

COPY . .
RUN chmod +x log_analyzer.sh

CMD ["./log_analyzer.sh"]