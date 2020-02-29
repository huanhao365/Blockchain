constant sample_function{
    //创建名为func_1的函数，并且传入一个uint8类型的参数和一个
    //int16类型的参数，函数通过returns指定返回int和string类型
    //的数据，
    function func_1(uint8 a, int16 b) returns(int c, string d){
        //在大括号{}之内是函数体，
        //这里是通过return返回returns指定的类型的数据
        return (10, "str");
    }
    
    function func_2(){
        int A;
        string memory B;
        //调用func_1()，结果是A=10，且B=str
        (A, B) = func_1(20, 30);
        //调用func_1()，结果是只有A=10
        (A, ) = func_1(20, 30);
        //调用func_1()，结果是只有B=str
        (, B) = func_1(20, 30);
    }
}