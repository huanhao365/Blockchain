constant sample_function{
    //������Ϊfunc_1�ĺ��������Ҵ���һ��uint8���͵Ĳ�����һ��
    //int16���͵Ĳ���������ͨ��returnsָ������int��string����
    //�����ݣ�
    function func_1(uint8 a, int16 b) returns(int c, string d){
        //�ڴ�����{}֮���Ǻ����壬
        //������ͨ��return����returnsָ�������͵�����
        return (10, "str");
    }
    
    function func_2(){
        int A;
        string memory B;
        //����func_1()�������A=10����B=str
        (A, B) = func_1(20, 30);
        //����func_1()�������ֻ��A=10
        (A, ) = func_1(20, 30);
        //����func_1()�������ֻ��B=str
        (, B) = func_1(20, 30);
    }
}