pragma Solidity ^0.4.25;

//创建合约sample_contract1和sample_contract2
contract sample_contract1{
    function a(){}
    function b(){}
}
contract sample_contract2 is sample_contract1{
    function b(){}
}

//同时继承自sample_contract1合约和sample_contract2合约
contract sample_contract3 is sample_contract1, sample_contract2{
    //创建本合约中的a()函数
    function a(){}
    
    function c(){
        //注意，这里调用的是sample_contract3合约中的函数a()
        a();
        
        //需要调用sample_contract1合约中的a()函数可以采用这样的方式
        sample_contract1.a();
        
        //这里调用的是sample_contract2合约中的函数b()，
        //因为sample_contract3与sample_contract2有较近的继承关系，所以
        //sample_contract2中的b()函数覆盖了sample_contract1中的b()函数
        b();
    }
}

//sample_contract4合约的构造函数带有参数
contract sample_contract4{
    function sample_contract4(int d){}
}

//sample_contract5合约继承自sample_contract4合约
//遇到所继承的父合约的构造函数带有参数的情况，子合约在继承语时要将
//这个参数显式地传递父合约。因为来自父合约的代码会被复制到子合约里
contract sample_contract5 is sample_contract4(100){
    
}