def decode_huffman(code_str, code_dict) -> str:
    decoded_s = str()
    code = str()
    for i in range(len(code_str)):
        code += code_str[i]
        if code in code_dict.keys():
            decoded_s += code_dict[code]
            code = ''
    return decoded_s


k, l = map(int, input().split())
code_dict = dict()

for _ in range(k):
    k_str = input().split()
    code_dict[k_str[-1]] = k_str[0][0]

code_s = input()
s = decode_huffman(code_s, code_dict)

print(s)
