contract sample1{
    int a;
    
    //�ڵ�һ����Լsample1�ڴ��������Ա���aִ�и���ֵͬ�ĺ�����
    //����������������payable�ؼ��֣���ʾ������Լ�ڵ�����Щ����
    //ʱ��Ҫ֧��һ����������̫��
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
    //sample2()�ǵڶ�����Լsample2�е�һ���չ��캯��
    function sample2{(){}
    
    function func_2(address contract_address){
        //sample2()�Ǳ���Լ�ڲ��ĺ���������ʹ��this�ؼ��ֽ��еĵ���
        //����Ϊ�ⲿ���ã����ں�����˵��this�ؼ��ִ���ǰ��Լʵ��
        this.sample2();
        
        //ͨ��new�ؼ��ִ���һ��sample1��Լ��ʵ����������Լʵ����ʱ��
        //����ú�Լ�Ĺ��캯��,����Ҫ��sample1��Լ�Ĺ��캯���ֱ���
        //��̫��(����ѡ���˷���12wei����̫��)�������ڵ���func_1()����
        //ʱҲ��Ҫ������̫��(���﷢����24wei����̫��)
        sample1 s1 = new sample1().value(12)(24);
        s1.func_1(35);
        
        //Ҳ���Զ�һ�������������η�����̫�ң�
        s1.func_2.value(30)(20);
        
        //ָ�����ú���ʱʹ�õ�gas������
        s1.func_2.gas(700)(12);
        
        //Ҳ�����ڷ�����̫�ҵ�ͬʱָ��ʹ�õ�gas������
        s1.func_2.value(40).gas(800)(20);
    }
}