for i in range(N):

    # 原始数据分为N个512 bits长的数据块。每个数据块又被分成16个32 bits长子数据块，
    # 这些子数据块可被存储在列表中并通过M[i][0]、M[i][1]、M[i][2]、...、M[i][15]的方式索引，
    # W存储的是中间值，可当作一个中间变量对待
    for j in range(16):
       W[j] = M[i][j]
    for k in range(16,64):
        W[k] = SSIGMA1(W[k - 2]) + W[k - 7] + SSIGMA0(W[k - 15]) + W[k - 16]

    # H[0][0]～[0][7]是SHA-256算法中的Hash初值
    # 用字母a～h分别代表8个32 bits长的中间变量
    a = H[i][0], b = H[i][1], c = H[i][2], d = H[i][3], e = H[i][4]
    f = H[i][5], g = H[i][6], h = H[i][7]

for t in range(64):
    # K[t]用于索引64个常量中的某一个
    T1 = h + LSIGMA1(e) + CH(e, f, g) + K[t] + W[t]
    T2 = LSIGMA0(a) + MAJ(a, b, c)
    h = g, g = f, f = e, e = d + T1, d = c, c = b, b = a, a = T1 + T2

    # 最后一遍循环结束后，H[i+1]所包含的就是我们拼凑Hash值得原始数据
    H[i+1][0] = a + H[i][0]
    H[i+1][1] = b + H[i][1]
    H[i+1][2] = c + H[i][2]
    H[i+1][3] = d + H[i][3]
    H[i+1][4] = e + H[i][4]
    H[i+1][5] = f + H[i][5]
    H[i+1][6] = g + H[i][6]
    H[i+1][7] = h + H[i][7]