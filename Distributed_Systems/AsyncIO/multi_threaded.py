import time
from threading import Thread

COUNT = 40000000

def countdown(n):
    while n > 0:
        n -= 1

threads = []
for i in range(4):
    threads.append(Thread(target=countdown, args=[COUNT//4]))

start = time.time()
for t in threads:
    t.start()
    t.join()
end = time.time()

print('Time taken in seconds', end - start)
