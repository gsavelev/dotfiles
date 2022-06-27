def find_dots(seqs: list) -> list:
    # отсортировать отрезки по точке конца
    # надёжный шаг: взять самую правую точку первого отрезка
    # выкинуть отрезки в которых она содержится
    # ====||====
    dots = list()
    seqs = sorted(seqs, key=lambda x: x[1])

    i = 0
    while i < len(seqs):
        r = seqs[i][1]
        dots.append(r)
        i += 1
        while i < len(seqs) and r in range(seqs[i][0], seqs[i][1] + 1):
            i += 1

    return dots


n = int(input())
seqs = list()

for i in range(n):
    l, r = map(int, input().split())
    seqs.append((l, r))

dots = find_dots(seqs)

print(len(dots))
print(*dots)
