def quick_sort(arr, l, r):
    if len(arr) == 1:
        return arr
    if l < r:
        m = partition(arr, l, r)
        quick_sort(arr, l, m - 1)
        quick_sort(arr, m + 1, r)
    return arr


def partition(arr, l, r):
    # TODO change fixed pivot to random one to increase speed
    x = arr[l]  # pivot
    j = l  # pointer
    for i in range(l, r):
        if arr[i] <= x:
            arr[i], arr[j] = arr[j], arr[i]
            j += 1
    # FIXME pointer (j) grater then len(arr)
    arr[j], arr[l] = arr[l], arr[j]
    return j


n, m = map(int, input().split())
a_points, b_points = [], []

for i in range(n):
    a, b = map(int, input().split())
    a_points.append(a)
    b_points.append(b)

dots = list(map(int, input().split()))

quick_sort(a_points, 0, n)
quick_sort(b_points, 0, n)

for dot in dots:
    # TODO
    #  - find amount of start ponits <= dot, call it amount_starts
    #  - find amount of end points > dot, call it amount_ends
    #  - return (amount_starts - amount_ends) WHY?
    pass
