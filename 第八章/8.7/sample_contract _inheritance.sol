pragma Solidity ^0.4.25;

//������Լsample_contract1��sample_contract2
contract sample_contract1{
    function a(){}
    function b(){}
}
contract sample_contract2 is sample_contract1{
    function b(){}
}

//ͬʱ�̳���sample_contract1��Լ��sample_contract2��Լ
contract sample_contract3 is sample_contract1, sample_contract2{
    //��������Լ�е�a()����
    function a(){}
    
    function c(){
        //ע�⣬������õ���sample_contract3��Լ�еĺ���a()
        a();
        
        //��Ҫ����sample_contract1��Լ�е�a()�������Բ��������ķ�ʽ
        sample_contract1.a();
        
        //������õ���sample_contract2��Լ�еĺ���b()��
        //��Ϊsample_contract3��sample_contract2�нϽ��ļ̳й�ϵ������
        //sample_contract2�е�b()����������sample_contract1�е�b()����
        b();
    }
}

//sample_contract4��Լ�Ĺ��캯�����в���
contract sample_contract4{
    function sample_contract4(int d){}
}

//sample_contract5��Լ�̳���sample_contract4��Լ
//�������̳еĸ���Լ�Ĺ��캯�����в�����������Ӻ�Լ�ڼ̳���ʱҪ��
//���������ʽ�ش��ݸ���Լ����Ϊ���Ը���Լ�Ĵ���ᱻ���Ƶ��Ӻ�Լ��
contract sample_contract5 is sample_contract4(100){
    
}