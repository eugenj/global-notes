# The interquartile range of an array is the difference between its first () and third () quartiles (i.e., ).
# 6
# 6 12 8 10 20 16
# 5 4 3 2 1 5

int(input().strip())
numbers = list(map(int, input().strip().split(' ')))
frequencies = list(map(int, input().strip().split(' ')))

# numbers = [6, 12, 8, 10, 20, 16]
# frequencies = [5, 4, 3, 2, 1, 5]

n = sum(frequencies)


def get_by_index(els, index):
    accumulated_index = 0
    for tupl in els:
        if tupl[1] + accumulated_index > index:
            return tupl[0]
        accumulated_index += tupl[1]

    return els[-1][0]


# [0..size-1]
def mean(els, begin, end):
    length = end - begin + 1
    if length % 2 == 0:
        return (get_by_index(els, begin + length / 2 - 1) + get_by_index(els, begin + length / 2)) / 2.0
    else:
        return get_by_index(els, begin + (length - 1) / 2)


elements = list(zip(numbers, frequencies))
elements = sorted(elements, key=lambda tup: tup[0])

if n % 2 == 0:
    q1 = round(mean(elements, 0, n / 2 - 1), 1)
    q3 = round(mean(elements, n / 2, n - 1), 1)
else:
    q1 = round(mean(elements, 0, (n - 1) / 2 - 1), 1)
    q3 = round(mean(elements, (n - 1) / 2 + 1, n - 1), 1)

print("%.1f" % (q3 - q1))
# for i in range(n):
#     print(get_by_index(elements, i))
