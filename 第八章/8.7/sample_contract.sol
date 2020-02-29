pragma Solidity ^0.4.25

contract sample_contract{
    //创建一些状态变量，类型可以是其他的，如字符串类型或数组类型等
    uint128 Count;
    address Address;
    
    //定义事件
    event log(unit128 CountEvent);
    
    //定义一个函数修改器
    modifier onlyOwner(){
        if (msg.sender !=owner) {
            throw;
        }
    }
    
    //定义一个构造函数，用于初始化状态变量Count和Address
    function sample_contract(uint128 initCount, address initAddress){
        Count = initCount;
        Address = initAddress;
    }
    
    //定义一个给状态变量赋值时触发log事件的普通函数
    function set_value(uint128 newCount) onlyOwner{
        log(newCount);
        Count = newCount;
    }
    
    //定义一个获取状态变量值并返回的普通函数
    function get_value() returns(uint128 returnedData) onlyOwner{
        return Count;
    }  
}