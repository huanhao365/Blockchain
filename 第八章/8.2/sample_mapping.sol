contract sample{
    //创建一个名为sample_mapping的mapping
    //sample_mapping中的键为int类型，值为string类型
    mapping (int => string) sample_mapping;
    
    function assignment(int key, string value){

        //这一句演示了mapping类型变量的赋值方式
        //key和value是从函数传递进来的参数
        sample_mapping[key] = value;
        
        //在函数内再创建一个mapping，注意sample_mapping2并不是
        //sample_mapping的复制，它只是sample_mapping的引用
        mapping (int => string) sample_mapping2 = sample_mapping;
    }
}