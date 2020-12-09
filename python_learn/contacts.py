# 4
# add hack
# add hackerrank
# find hac
# find hak
#
# 2
# 0

answer = ''
dictionary_head = {}


def add(value, dictionary):
    first_char = value[0]
    dict_next = dictionary.get(first_char)
    if dict_next is None:
        dict_next = {'_': 0}
        dictionary[first_char] = dict_next

    dict_next['_'] += 1

    if len(value) > 1:
        add(value[1:], dict_next)
    else:
        dict_next[None] = 1


def count_leafs(dictionary):
    return dictionary['_']
    # counter = 0
    # for key in dictionary:
    #     if key is None:
    #         counter += 1
    #     else:
    #         counter += count_leafs(dictionary[key])
    # return counter


def find(value, dictionary):
    if len(value) > 0:
        first_char = value[0]
        dict_next = dictionary.get(first_char)
        if dict_next is not None:
            return find(value[1:], dict_next)
        else:
            return 0
    else:
        return count_leafs(dictionary)


def find_print(value):
    global answer
    answer += (str(find(value, dictionary_head)) + '\n')


n = int(input().strip())
for a0 in range(n):
    op, contact = input().strip().split(' ')
    if op == 'add':
        add(contact, dictionary_head)
    else:
        find_print(contact)
print(answer)

# print(dictionary_head)
# add('hack', dictionary_head)
# add('hackerrank', dictionary_head)
# find_print('hak')
# find_print('hac')
