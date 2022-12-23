import time
from multiprocessing import Pool

COUNT = 40000000

def countdown(n):
    while n > 0:
        n -= 1

if __name__ == '__main__':
    pool = Pool(processes=4)
    start = time.time()
    for i in range(4):
        pool.apply_async(countdown, [COUNT//4])
    pool.close()
    pool.join()
    end = time.time()

    print('Time taken in seconds', end - start)
