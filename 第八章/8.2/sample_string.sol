contract sample{
    //ʹ��string�ؼ��ֺ�bytes�ؼ��ִ����ַ������������ں������ⲿ������
    //����sample_String��sample_Bytes����Ϊ״̬��������storage�洢��
    //����ں����ڴ����������������memory�ؼ�����д�洢λ��
    string sample_String = "";  //myString��һ�����ַ���
    bytes sample_Bytes;
	
    function sample(string initString, bytes initBytes){
        
        //��sample_String��sample_Bytes��ֵ������initString��
        /initBytes����/�Ӻ������ݽ������ֱ���string��bytes����
        sample_String = initString;   
        sample_Bytes = initBytes; 
        
        //����string�ͱ���sample_String2���Ƕ�sample_String������
        string sample_String2 = sample_String;
        
        //����string�ͱ���myString3������ʼ����
        //�������ں����ڣ����Կ������memory�ؼ���
        string memory sample_String3 = "ABCDE";
        
        //�������ַ���û��memory�ؼ�����д�洢λ�ã�����ʱ�׳��쳣
        string sample_String4 = "Example";
		
        //���¸�ֵsample_String3�����ݣ�ͬʱ����Ҳ�����˱仯
        sample_String3 = "XYZ";
		
        //����sample_Bytes�ĳ���
        sample_Bytes.length++;
    }
}