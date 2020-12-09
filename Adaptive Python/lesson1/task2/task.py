n, w = list(map(int, input().split(' ')))

items = []

for i in range(n):
    ci, wi = list(map(int, input().split(' ')))
    items.append((ci, wi, ci / wi))

items = sorted(items, key=lambda t: t[2], reverse=True)
current_volume = 0
current_cost = 0

used_all = True
for next_item in items:
    if current_volume + next_item[1] <= w:
        current_cost += next_item[0]
        current_volume += next_item[1]
    else:
        used_all = False
        break

if not used_all:
    portion = (w - current_volume) / next_item[1]
    current_cost += next_item[0] * portion

print("%.3f" % current_cost)
