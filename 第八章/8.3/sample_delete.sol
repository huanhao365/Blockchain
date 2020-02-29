contract sample{
    //创建一个int型数组
    int[] sample_array;
    
    //定义一个结构体类型并创建一个该结构体类型的实例sample_struct
    struct Struct{
        mapping (int => int) sample_mapping;
        int sample_number;
    }
    Struct sample_struct;
    
    function assignment(int key, int value, int number, int[] array){
        //这是一个赋值的函数，在函数内首先根据参数设置结构体sample_struct
        //内整型变量的值
        sample_struct = Struct(number);
        
        //然后再根据参数设置结构体sample_struct内mapping变量的值
        sample_struct.sample_mapping[key] = value;
        
        //函数的最后是根据参数设置数组sample_array的值
        sample_array = array;
    }
    
    function use_delete(int key){
        //这是一个示例使用delete关键字的函数
        //先用delete关键字操作动态长度的数组，这会删除数组内的所有元素
        delete sample_array;
        
        //然后用delete关键字操作结构体实例sample_struct，此时结构体内的
        //整型变量sample_number被重置为0，但是sample_mapping没有受到影响
        delete sample_struct;
        
        //最后使用delete关键字操作结构体sample_struct内的sample_mapping，
        //这里指定了sample_struct的要执行delete的键，所以会删除与该键关联的值
        delete sample_struct.sample_mapping[key];
    }
}