contract sample{ 
    //����һ���ṹ�壬�ڽṹ��sample_struct����һ������(bool)�ͱ���
    //��һ���ַ���(string)�ͱ���
    struct sample_struct{
        bool myBool;
        string myString;
    }
    
    //����һ���ṹ��ʵʵ��sample1��
    //������ṹ��ʵ����û�и����ṹ���ڱ�����ֵ
    sample_struct sample1;
    
    //�ٴ���һ���ṹ��ʵ��sample2��
    //������ṹ���и����˽ṹ����bool�ͱ�����ֵ
    sample_struct sample2 = sample_struct(true, "");
    
    function assignment(bool initBool, string initString)
    {
        //�ں���assignment()�ڶԽṹ��ʵ�� sample1��ֵ��initBool��
        //initString�����Ժ����Ĳ�����Ҫ����ṹ������ָ�ֵ��ʽ
        sample1 = sample_struct(initBool, initString);
        
        //�ִ���һ����Ϊsample3�Ľṹ��ʵ�������Ҹ����˽ṹ���ڱ�����ֵ
        //��������ṹ��ʵ��ͨ��memory�ؼ���ָ���˴洢��λ��
        sample_struct memory sample3 = sample_struct(initBool, initString);
    }
}