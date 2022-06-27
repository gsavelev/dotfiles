def fib_mod(n, m):
    f_arr_m = [0, 1]

    if n == 0:
        return 0
    elif n == 1 or n == 2:
        return 1 % m
    else:
        i = 0
        while i < (n - 1):
            f_arr_m.append(((f_arr_m[0]) % m + (f_arr_m[1]) % m) % m)
            # f_arr_m.append(f_arr_m[0] + f_arr_m[1])
            f_arr_m.pop(0)
            i += 1

        return f_arr_m[1]


def main():
    n, m = map(int, input().split())
    print(fib_mod(n, m))


if __name__ == "__main__":
    main()