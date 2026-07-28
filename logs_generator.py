import random, time

ips = ["192.168.1.10", "10.0.0.42", "172.16.0.5", "8.8.8.8", "192.168.1.105", "185.22.14.9"]
pages = ["/index.html", "/api/v1/users", "/login", "/dashboard", "/admin/config", "/images/logo.png"]
methods = ["GET", "POST", "DELETE", "GET"]
statuses = [200, 200, 401, 403, 500, 200]

with open("log.log", "w") as f:
    for i in range(1000):
        ip = random.choice(ips)
        page = random.choice(pages)
        method = random.choice(methods)
        status = random.choice(statuses)
        
        err_msg = " ERROR: System Failure" if status in [403, 500, 401] else ""
        
        timestamp = time.strftime("%d/%b/%Y:%H:%M:%S +0300", time.localtime(time.time() - random.randint(0, 86400)))
        
        log_line = f'{ip} - - [{timestamp}] "{method} {page} HTTP/1.1" {status} {random.randint(100, 5000)} "https://google.com" "Mozilla/5.0"{err_msg}\n'
        f.write(log_line)

print("Done! log.log with 1000 lines has been generated.")