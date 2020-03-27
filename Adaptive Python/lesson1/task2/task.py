n = int(input())
w = int(input())

costs = []
volumes = []

for i in range(n):
    costs.append(int(input()))
    volumes.append(int(input()))

items = zip(costs, volumes)
items = sorted(items, key=lambda t: t[0])

current_volume = 0
current_cost = 0

for next_item in items:
    if current_volume + next_item[1] < w:
        current_cost += next_item[0]
        current_volume += next_item[1]

portion = (w - current_volume) / next_item[1]
current_cost += round(next_item[0] * portion, 3)
print("%f.3" % current_cost)
