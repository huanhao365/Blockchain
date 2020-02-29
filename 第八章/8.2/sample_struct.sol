contract sample{ 
    //创建一个结构体，在结构体sample_struct内有一个布尔(bool)型变量
    //和一个字符串(string)型变量
    struct sample_struct{
        bool myBool;
        string myString;
    }
    
    //创建一个结构体实实例sample1，
    //在这个结构体实例中没有给出结构体内变量的值
    sample_struct sample1;
    
    //再创建一个结构体实例sample2，
    //在这个结构体中给出了结构体内bool型变量的值
    sample_struct sample2 = sample_struct(true, "");
    
    function assignment(bool initBool, string initString)
    {
        //在函数assignment()内对结构体实例 sample1赋值，initBool和
        //initString均来自函数的参数，要留意结构体的这种赋值方式
        sample1 = sample_struct(initBool, initString);
        
        //又创建一个名为sample3的结构体实例，并且给出了结构体内变量的值
        //但是这个结构体实例通过memory关键字指定了存储的位置
        sample_struct memory sample3 = sample_struct(initBool, initString);
    }
}