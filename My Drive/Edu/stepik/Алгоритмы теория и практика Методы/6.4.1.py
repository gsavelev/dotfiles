def merge_sort(arr, inv_c):
    if len(arr) < 2:
        return arr, inv_c
    result = list()
    m = len(arr) // 2
    a, inv_c = merge_sort(arr[:m], inv_c)
    b, inv_c = merge_sort(arr[m:], inv_c)
    i, j = 0, 0
    while i < len(a) and j < len(b):
        if a[i] > b[j]:
            inv_c += len(a) - i
            result.append(b[j])
            j += 1
        else:
            result.append(a[i])
            i += 1
    result += a[i:]
    result += b[j:]
    return result, inv_c


n = int(input())
a = list(map(int, input().split()))
print(merge_sort(a, 0)[1])
