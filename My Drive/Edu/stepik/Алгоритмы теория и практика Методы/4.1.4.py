def func1(n):
    total_coins = 0
    while n > 0:
        if n / 25 >= 1:
            d = 25
        elif n / 10 >= 1:
            d = 10
        elif n / 5 >= 1:
            d = 5
        else:
            d = 1
        coins = n // d
        total_coins += coins
        back = coins * d
        n -= back
    return total_coins

print(func1(231))
