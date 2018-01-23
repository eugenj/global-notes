class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def checkBST(root: node, low = None, up = None) -> bool:
    if root is None:
        return True

    if root.left is not None:
        if root.left.data >= root.data:
            return False
        elif low is not None and root.left.data <= low:
            return False

    if root.right is not None:
        if root.right.data <= root.data:
            return False
        elif up is not None and root.right.data >= up:
            return False

    return checkBST(root.left, low, root.data) and checkBST(root.right, root.data, up)

root = node(10)
root.left = node(5)
root.right = node(20)

root.left.left = node(3)
root.left.right = node(5)

print(checkBST(root))
# No
# 2
# 1 2 2 4 5 6 7
