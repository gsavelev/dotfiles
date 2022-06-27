def bin_search(arr, n, i):
    l = 0
    r = n - 1
    while l <= r:
        m = (l + r) // 2
        if arr[m] == i:
            return m + 1
        elif arr[m] > i:
            r = m - 1
        else:
            l = m + 1
    return -1


n, *a = map(int, input().split())
k, *b = map(int, input().split())

for b_val in b:
    print(bin_search(a, n, b_val), end=' ')
