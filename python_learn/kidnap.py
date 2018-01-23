def ransom_note(magazine_parameter, ransom_parameter):
    map_of_counters = {}
    for word in magazine_parameter:
        counter = map_of_counters.pop(word, 0)
        map_of_counters[word] = counter + 1

    for word in ransom_parameter:
        counter = map_of_counters.pop(word, 0)
        if counter == 0:
            return False
        else:
            map_of_counters[word] = counter - 1
    return True

m, n = map(int, input().strip().split(' '))
magazine = input().strip().split(' ')
ransom = input().strip().split(' ')
answer = ransom_note(magazine, ransom)

if answer:
    print("Yes")
else:
    print("No")

# Run parameters
# 6 4
# give me one grand today night
# give one grand today
