def fib(n):
    fib_arr = [None] * (n + 1)
    fib_arr[0] = 0
    fib_arr[1] = 1

    for i in range(2, n + 1):
        fib_arr[i] = fib_arr[i - 1] + fib_arr[i - 2]

    return fib_arr[n]


def main():
    n = int(input())
    print(fib(n))


if __name__ == "__main__":
    main()