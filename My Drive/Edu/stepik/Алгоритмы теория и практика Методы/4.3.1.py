class MaxHeap:
    def __init__(self):
        self.heap = list()

    def sift_up(self, i):
        while i > 0 and self.heap[i] > self.heap[(i - 1) // 2]:
            self.heap[i], self.heap[(i - 1) // 2] =\
                self.heap[(i - 1) // 2], self.heap[i]
            i = (i - 1) // 2

    def sift_down(self, i):
        while (i * 2 + 1) <= len(self.heap):  # it's not a leaf
            j = i
            if (i * 2 + 1) < len(self.heap)\
                    and self.heap[i * 2 + 1] > self.heap[j]:
                j = i * 2 + 1
            if (i * 2 + 2) < len(self.heap)\
                    and self.heap[i * 2 + 2] > self.heap[j]:
                j = i * 2 + 2
            if j == i:
                break
            self.heap[i], self.heap[j] = self.heap[j], self.heap[i]
            i = j

    def insert(self, p):
        self.heap.append(p)
        i = len(self.heap) - 1
        self.sift_up(i)

    def extract_max(self):
        now_max = self.heap[0]
        if len(self.heap) == 1:
            self.heap.pop()
        elif len(self.heap) > 1:
            self.heap[0] = self.heap.pop()
            self.sift_down(0)
        return now_max


if __name__ == '__main__':
    n = int(input())
    heap = MaxHeap()
    for _ in range(n):
        arg = input()
        if arg.startswith('Insert'):
            arg = arg.split()
            heap.insert(int(arg[1]))
        else:
            now_max = heap.extract_max()
            print(now_max)
