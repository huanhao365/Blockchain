contract sample{
    //创建一个动态长度的int型数组，数组名为sample_array
    //sample_array数组存储有两个初始的值
    int[] sample_array = [3,4];
    
    function assignment(uint index, int value){
        //数组允许通过位置索引的方式进行赋值
        //这一句就是对数组sample_array使用位置索引并完成赋值
        //index和value均来自函数参数
        sample_array[index] = value;
        
        //数组间也能互相赋值，前提是这两个数组存储的值的数据类型相同
        //或相近，其次，如果使用动态长度的数组对其他数组赋值，那么
        //被赋值的数组最好也是动态长度的
        int[] sample_array2 = sample_array;
        
        //这一句是创建了一个固定长度的数组sample_array3并赋予了初始值，
        //在数组sample_array3内只存储有三个元素。但是这一句会抛出异常，
        //原因是uint类型的数组要存储在memory中
        uint24[3] sample_array3 = [5, 6, 7];
        
        ///这一句还是创建了一个固定长度的数组并赋予了初始值，
        //但是这个数组通过memory关键字指定了存储的位置，所以不会抛出异常
        uint8[2] memory sample_array4 = [8,9];
    }
}