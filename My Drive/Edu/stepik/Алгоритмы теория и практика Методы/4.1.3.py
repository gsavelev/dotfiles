def find_nums(n: int) -> list:
    nums = list()
    num = 0
    while n > 0:
        num += 1
        n -= num
        if n <= num:
            num += n
            n -= num
        nums.append(num)
    return nums


n = int(input())
nums = find_nums(n)

print(len(nums))
print(*nums)
