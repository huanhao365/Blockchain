contract sample{
    //����һ����̬���ȵ�int�����飬������Ϊsample_array
    //sample_array����洢��������ʼ��ֵ
    int[] sample_array = [3,4];
    
    function assignment(uint index, int value){
        //��������ͨ��λ�������ķ�ʽ���и�ֵ
        //��һ����Ƕ�����sample_arrayʹ��λ����������ɸ�ֵ
        //index��value�����Ժ�������
        sample_array[index] = value;
        
        //�����Ҳ�ܻ��ำֵ��ǰ��������������洢��ֵ������������ͬ
        //���������Σ����ʹ�ö�̬���ȵ�������������鸳ֵ����ô
        //����ֵ���������Ҳ�Ƕ�̬���ȵ�
        int[] sample_array2 = sample_array;
        
        //��һ���Ǵ�����һ���̶����ȵ�����sample_array3�������˳�ʼֵ��
        //������sample_array3��ֻ�洢������Ԫ�ء�������һ����׳��쳣��
        //ԭ����uint���͵�����Ҫ�洢��memory��
        uint24[3] sample_array3 = [5, 6, 7];
        
        ///��һ�仹�Ǵ�����һ���̶����ȵ����鲢�����˳�ʼֵ��
        //�����������ͨ��memory�ؼ���ָ���˴洢��λ�ã����Բ����׳��쳣
        uint8[2] memory sample_array4 = [8,9];
    }
}