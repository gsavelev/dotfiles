class MinHeap:
    def __init__(self):
        self.heap = list()

    def sift_up(self, i: tuple):
        while i > 0 and self.heap[i][1] < self.heap[(i - 1) // 2][1]:
            self.heap[i], self.heap[(i - 1) // 2] = \
                self.heap[(i - 1) // 2], self.heap[i]
            i = (i - 1) // 2

    def sift_down(self, i: tuple):
        while (i * 2 + 1) <= len(self.heap):  # it's not a leaf
            j = i
            if (i * 2 + 1) < len(self.heap) \
                    and self.heap[i * 2 + 1][1] < self.heap[j][1]:
                j = i * 2 + 1
            if (i * 2 + 2) < len(self.heap) \
                    and self.heap[i * 2 + 2][1] < self.heap[j][1]:
                j = i * 2 + 2
            if j == i:
                break
            self.heap[i], self.heap[j] = self.heap[j], self.heap[i]
            i = j

    def insert(self, p):
        self.heap.append(p)
        i = len(self.heap) - 1
        self.sift_up(i)

    def extract_min(self):
        now_min = self.heap[0]
        if len(self.heap) == 1:
            self.heap.pop()
        elif len(self.heap) > 1:
            self.heap[0] = self.heap.pop()
            self.sift_down(0)
        return now_min


class Node(MinHeap):
    def __init__(self, left_child, right_child):
        self.left_child = left_child
        self.right_child = right_child


def counter(s: str) -> dict:
    priority_dict = dict()
    for sym in s:
        if sym not in priority_dict:
            priority_dict[sym] = 1
        else:
            priority_dict[sym] += 1
    return priority_dict


def traverse(root, prefix, code_dict) -> dict:
    if isinstance(root, str):
        code_dict[root] = ''.join(prefix)
        return code_dict

    prefix.append('0')
    code_dict = traverse(root.left_child, prefix, code_dict)
    prefix.pop()

    prefix.append('1')
    code_dict = traverse(root.right_child, prefix, code_dict)
    prefix.pop()

    return code_dict


def encode_huffman(s, code_dict) -> str:
    s_encoded = str()
    for sym in s:
        s_encoded += code_dict[sym]
    return s_encoded


def print_output(code_s, code_dict, n):
    print(n, len(code_s), end='\n')
    for letter, code in code_dict.items():
        print(f"{letter}: {code}")
    print(code_s)


def huffman(s, heap):
    priority_dict = counter(s)
    n = len(priority_dict)

    # init min heap with sym frequencies
    for elem, freq in priority_dict.items():
        heap.insert((elem, freq))

    # build Huffman bin tree
    for k in range(n + 1, (2 * n)):
        (i, f_i) = heap.extract_min()
        (j, f_j) = heap.extract_min()
        # create tree root with childs i, j and sum of their frequencies
        f_k = f_i + f_j
        k = Node(i, j)
        heap.insert((k, f_k))

    tree = heap.heap[0][0]

    if isinstance(tree, str):
        code_dict = {tree: '0'}
    else:
        code_dict = traverse(tree, prefix=list(), code_dict=dict())

    code_s = encode_huffman(s, code_dict)

    print_output(code_s, code_dict, n)


if __name__ == '__main__':
    s = input()
    heap = MinHeap()
    huffman(s, heap)
