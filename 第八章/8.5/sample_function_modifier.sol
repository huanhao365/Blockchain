contract sample{
    int a = 10;
    
    //���������޸���sample_modifer1
    modifier sample_modifer1(int b){
        int c = b;
        int d = a;
        _;
    }
    
    //���������޸���sample_modifer2
    modifier sample_modifer2(int e){
        int f = e;
        int g = e;
        return;
        _;
    }
    
    //���������޸���sample_modifer3
    modifier sample_modifer3(int h){
        int i = h;
        _;
        int j = h;
    }
    
    //func1��ʹ�������������޸����ĺ���
    function func1() sample_modifer1 sample_modifer2 sample_modifer3
    returns (int k){
        a = 20;
        return a;
    }
}