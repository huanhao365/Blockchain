contract sample{
    //����һ��int������
    int[] sample_array;
    
    //����һ���ṹ�����Ͳ�����һ���ýṹ�����͵�ʵ��sample_struct
    struct Struct{
        mapping (int => int) sample_mapping;
        int sample_number;
    }
    Struct sample_struct;
    
    function assignment(int key, int value, int number, int[] array){
        //����һ����ֵ�ĺ������ں��������ȸ��ݲ������ýṹ��sample_struct
        //�����ͱ�����ֵ
        sample_struct = Struct(number);
        
        //Ȼ���ٸ��ݲ������ýṹ��sample_struct��mapping������ֵ
        sample_struct.sample_mapping[key] = value;
        
        //����������Ǹ��ݲ�����������sample_array��ֵ
        sample_array = array;
    }
    
    function use_delete(int key){
        //����һ��ʾ��ʹ��delete�ؼ��ֵĺ���
        //����delete�ؼ��ֲ�����̬���ȵ����飬���ɾ�������ڵ�����Ԫ��
        delete sample_array;
        
        //Ȼ����delete�ؼ��ֲ����ṹ��ʵ��sample_struct����ʱ�ṹ���ڵ�
        //���ͱ���sample_number������Ϊ0������sample_mappingû���ܵ�Ӱ��
        delete sample_struct;
        
        //���ʹ��delete�ؼ��ֲ����ṹ��sample_struct�ڵ�sample_mapping��
        //����ָ����sample_struct��Ҫִ��delete�ļ������Ի�ɾ����ü�������ֵ
        delete sample_struct.sample_mapping[key];
    }
}