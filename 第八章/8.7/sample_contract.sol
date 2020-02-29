pragma Solidity ^0.4.25

contract sample_contract{
    //����һЩ״̬���������Ϳ����������ģ����ַ������ͻ��������͵�
    uint128 Count;
    address Address;
    
    //�����¼�
    event log(unit128 CountEvent);
    
    //����һ�������޸���
    modifier onlyOwner(){
        if (msg.sender !=owner) {
            throw;
        }
    }
    
    //����һ�����캯�������ڳ�ʼ��״̬����Count��Address
    function sample_contract(uint128 initCount, address initAddress){
        Count = initCount;
        Address = initAddress;
    }
    
    //����һ����״̬������ֵʱ����log�¼�����ͨ����
    function set_value(uint128 newCount) onlyOwner{
        log(newCount);
        Count = newCount;
    }
    
    //����һ����ȡ״̬����ֵ�����ص���ͨ����
    function get_value() returns(uint128 returnedData) onlyOwner{
        return Count;
    }  
}