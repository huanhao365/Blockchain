contract sample{
    
    //ʹ��enum�ؼ��ִ���һ����Ϊsample_enuum��ö��ֵ
    enum sample_enuum{one,two,three,four}
    
    //��ʹ��һ��ö��ֵǰҪ�ȴ���һ��ö��ֵʵ��
    sample_enuum enum1;
    
    //ö��ֵʵ��������໥��ֵ��assignment()�����Ĳ�����һ��ö��ֵ����
    //���Ҫ�ı�enum1��ֵ����ô����ѡ��������ö��ֵ������Ϊ����
    function assignment(sample_enuum enum2){
        enum1 = enum2;
    }
    
    //��ö��ֵ���͵�ʵ��enum1�е�����ö��ֵ����Ϊtwo
    function setNumber(){
        enum1 = sample_enuum.two;
    }
    
    //�����ķ���ֵҲ������ö��ֵ������
    function getNumber() returns(sample_enuum){
        return enum1;
    }
}