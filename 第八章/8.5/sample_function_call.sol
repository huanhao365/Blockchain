contract sample1{
    int a;
    
    //在第一个合约sample1内创建三个对变量a执行赋不同值的函数，
    //这三个函数都带有payable关键字，表示其他合约在调用这些函数
    //时需要支付一定数量的以太币
    function sample1(int b) payable
    {
        a = b;
    }
    function func_1(int c) payable
    {
        a = c;
    }
    function func_2(int d) payable
    {
        a = d;
    }
}


contract sample2{
    //sample2()是第二个合约sample2中的一个空构造函数
    function sample2{(){}
    
    function func_2(address contract_address){
        //sample2()是本合约内部的函数，但是使用this关键字进行的调用
        //被称为外部调用，对于函数来说，this关键字代表当前合约实例
        this.sample2();
        
        //通过new关键字创建一个sample1合约的实例，创建合约实例的时候
        //会调用合约的构造函数,所以要向sample1合约的构造函数分别发送
        //以太币(这里选择了发送12wei的以太币)，另外在调用func_1()函数
        //时也需要发送以太币(这里发送了24wei的以太币)
        sample1 s1 = new sample1().value(12)(24);
        s1.func_1(35);
        
        //也可以对一个函数连续两次发送以太币，
        s1.func_2.value(30)(20);
        
        //指定调用函数时使用的gas的数量
        s1.func_2.gas(700)(12);
        
        //也可以在发送以太币的同时指定使用的gas的数量
        s1.func_2.value(40).gas(800)(20);
    }
}