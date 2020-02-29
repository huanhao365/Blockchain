import hashlib
import time

# 定义最大的Nonce值，在尝试不同的Nonce值时不超过该值
Max_nonce = 2 ** 32

# 进入循环，difficulty_bits就是这里的难度位
for difficulty_bits in range(32):
    print("Strating, difficulty_level is %d \n"
          "difficulty_bits is: %d bits"
          % (2 ** difficulty_bits, difficulty_bits))

    # 记录每一轮开始的时间
    start_time = time.time()

    # 这部分实现的就是简化版的工作量证明算法，Block_data相当于在
    # 每一个难度等级下用于计算SHA-256哈希值的区块数据。
    # difficulty_target是难度目标值，由difficulty_bits难度位值计算而来。
    # 工作量证明算法的核心是在一个for循环中尝试所有的从0到Max_nonce之间
    # 的Nonce值，并计算将Nonce值添加到区块数据后所得的SHA-256哈希值，
    # 如果这个值小于difficulty_target是难度目标值，那么挖矿成功，打印
    # 成功的Nonce值及此时的SHA-256哈希值
    SHA_256_hash = " "
    Block_data = "test_block" + SHA_256_hash
    difficulty_target = 2 ** (256 - difficulty_bits)
    print("target_hex is:%s" % hex(2 ** (256 - difficulty_bits)))
    for Nonce in range(Max_nonce):
        SHA_256_hash = hashlib.sha256((str(Block_data) +
                                       str(Nonce))
                                      .encode("utf8")).hexdigest()
        if int(SHA_256_hash, 16) < difficulty_target:
            print("Success, The Nonce is: %d" % Nonce)
            print("SHA-256 Hash is: %s" % SHA_256_hash)
            break

    # 这部分代码的作用主要是打印耗时信息，end_tome要与start_time
    # 相互配合
    end_tome = time.time()
    elapsed_time = end_tome - start_time
    print("elapsed_time is: %0.4f seconds" % elapsed_time)

'''
Strating, difficulty_level is 1 
difficulty_bits is: 0 bits
target_hex is:0x10000000000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 0
SHA-256 Hash is: cf1e9caa376e5911ac07195b2d8817f2849d7ab35bc74388845dceba3a926e97
elapsed_time is: 0.0001 seconds
Strating, difficulty_level is 2 
difficulty_bits is: 1 bits
target_hex is:0x8000000000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 1
SHA-256 Hash is: 5ec4e6d7bea40f60cab803871f9ed76c03baf495e9fb8bc8295d0b4d9f144e22
elapsed_time is: 0.0000 seconds
Strating, difficulty_level is 4 
difficulty_bits is: 2 bits
target_hex is:0x4000000000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 2
SHA-256 Hash is: 39dd2565f295d3bb93fb455e15852dacbfcc2e4a5d0e5af7f193d4136e904443
elapsed_time is: 0.0000 seconds
Strating, difficulty_level is 8 
difficulty_bits is: 3 bits
target_hex is:0x2000000000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 21
SHA-256 Hash is: 136b623bd2c5a76a2b13ac88ce0e9f83102648f3bf8bb4d401485e12a5a21e08
elapsed_time is: 0.0001 seconds
...
Strating, difficulty_level is 16777216 
difficulty_bits is: 24 bits
target_hex is:0x10000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 42239239
SHA-256 Hash is: 00000028b5e78d239bafd4e17840f9014cd69a8d6afba808b8b7a7b3d176f900
elapsed_time is: 96.9077 seconds
Strating, difficulty_level is 33554432 
difficulty_bits is: 25 bits
target_hex is:0x8000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 42239239
SHA-256 Hash is: 00000028b5e78d239bafd4e17840f9014cd69a8d6afba808b8b7a7b3d176f900
elapsed_time is: 101.1458 seconds
Strating, difficulty_level is 67108864 
difficulty_bits is: 26 bits
target_hex is:0x4000000000000000000000000000000000000000000000000000000000
Success, The Nonce is: 42239239
SHA-256 Hash is: 00000028b5e78d239bafd4e17840f9014cd69a8d6afba808b8b7a7b3d176f900
elapsed_time is: 96.3301 seconds
'''