def fib_digit(n):
    fib_arr_sum = [None] * (n + 1)
    fib_arr_sum[0] = 0
    fib_arr_sum[1] = 1

    for i in range(2, n + 1):
        a = fib_arr_sum[i - 1] % 10
        b = fib_arr_sum[i - 2] % 10
        fib_arr_sum[i] = (a + b) % 10

    return fib_arr_sum[n]


def main():
    n = int(input())
    print(fib_digit(n))


if __name__ == "__main__":
    main()