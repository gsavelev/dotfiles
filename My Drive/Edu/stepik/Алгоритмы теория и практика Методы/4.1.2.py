def calc_best_c(items: list, w_backpack: int) -> float:
    def calc_cw(item):
        return item[0] / item[1]
    # calc c_w c per w for each
    # sort items by c_w
    # fill backpack by the best and part of worse
    res = 0
    items = sorted(items, key=calc_cw, reverse=True)

    i = 0
    while i < len(items) and w_backpack > 0:
        item = items[i]

        c = item[0]
        w = item[1]

        # if it fit put whole item into backpack
        # also put the part
        # minus w_backpack
        if w >= w_backpack:
            cw = calc_cw(item)
            w = w_backpack
            c = w * cw

        res += c
        w_backpack -= w
        i += 1

    return res


items = list()
n, w_backpack = map(int, input().split())

for _ in range(n):
    c, w = map(int, input().split())
    items.append((c, w))

print(calc_best_c(items, w_backpack))
