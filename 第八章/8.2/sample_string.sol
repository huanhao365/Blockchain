contract sample{
    //使用string关键字和bytes关键字创建字符串。由于是在函数的外部创建，
    //所以sample_String和sample_Bytes被作为状态变量按照storage存储，
    //如果在函数内创建变量，则可以用memory关键字重写存储位置
    string sample_String = "";  //myString是一个空字符串
    bytes sample_Bytes;
	
    function sample(string initString, bytes initBytes){
        
        //给sample_String和sample_Bytes赋值，其中initString和
        /initBytes都是/从函数传递进来，分别是string和bytes类型
        sample_String = initString;   
        sample_Bytes = initBytes; 
        
        //创建string型变量sample_String2，是对sample_String的引用
        string sample_String2 = sample_String;
        
        //创建string型变量myString3，并初始化，
        //由于是在函数内，所以可以添加memory关键字
        string memory sample_String3 = "ABCDE";
        
        //创建的字符串没有memory关键字重写存储位置，编译时抛出异常
        string sample_String4 = "Example";
		
        //重新赋值sample_String3的内容，同时长度也发生了变化
        sample_String3 = "XYZ";
		
        //增加sample_Bytes的长度
        sample_Bytes.length++;
    }
}