contract sample{
    //����һ����Ϊsample_mapping��mapping
    //sample_mapping�еļ�Ϊint���ͣ�ֵΪstring����
    mapping (int => string) sample_mapping;
    
    function assignment(int key, string value){

        //��һ����ʾ��mapping���ͱ����ĸ�ֵ��ʽ
        //key��value�ǴӺ������ݽ����Ĳ���
        sample_mapping[key] = value;
        
        //�ں������ٴ���һ��mapping��ע��sample_mapping2������
        //sample_mapping�ĸ��ƣ���ֻ��sample_mapping������
        mapping (int => string) sample_mapping2 = sample_mapping;
    }
}