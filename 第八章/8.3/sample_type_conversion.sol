contract sample{
    //a是一个uint64类型的变量
    uint64 a = 0x1122334455667788;
    
    //创建一个uint16类型的变量b，将a的数值的高位截断而只保留
    //其值的最后16位并将这个值赋给b，这样对a本身无影响
    uint16 b = uint16(a);
} 