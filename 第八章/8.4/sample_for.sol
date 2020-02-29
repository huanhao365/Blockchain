constant sample{
    int[6] c;
    function sample_for(){
        
        //这个for循环结构执行的条件是d小于数组c的长度，d是循环开始前
        //临时创建的一个值为0的变量，每执行完一轮循环后，d都会自加1,
        //直到d的值为5，for循环才退出，也就是说，这个for循环执行了6轮
        for(var d=0, d<c.length, d++){
            //for循环内要执行的代码写在这个大括号内
        }
    }
}