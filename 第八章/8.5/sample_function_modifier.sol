contract sample{
    int a = 10;
    
    //创建函数修改器sample_modifer1
    modifier sample_modifer1(int b){
        int c = b;
        int d = a;
        _;
    }
    
    //创建函数修改器sample_modifer2
    modifier sample_modifer2(int e){
        int f = e;
        int g = e;
        return;
        _;
    }
    
    //创建函数修改器sample_modifer3
    modifier sample_modifer3(int h){
        int i = h;
        _;
        int j = h;
    }
    
    //func1是使用了三个函数修改器的函数
    function func1() sample_modifer1 sample_modifer2 sample_modifer3
    returns (int k){
        a = 20;
        return a;
    }
}