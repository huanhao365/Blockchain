contract sample{
    
    //使用enum关键字创建一个名为sample_enuum的枚举值
    enum sample_enuum{one,two,three,four}
    
    //在使用一个枚举值前要先创建一个枚举值实例
    sample_enuum enum1;
    
    //枚举值实例间可以相互赋值，assignment()方法的参数是一个枚举值类型
    //如果要改变enum1的值，那么可以选择其他的枚举值类型作为参数
    function assignment(sample_enuum enum2){
        enum1 = enum2;
    }
    
    //将枚举值类型的实例enum1中的所有枚举值都设为two
    function setNumber(){
        enum1 = sample_enuum.two;
    }
    
    //函数的返回值也可以是枚举值的类型
    function getNumber() returns(sample_enuum){
        return enum1;
    }
}