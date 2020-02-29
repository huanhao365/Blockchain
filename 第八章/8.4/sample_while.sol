constant sample{
    var b = 20;
    function sample_while(){
        //开始一个while循环控制结构
        //进行循环的条件是变量b<30
        while(b < 30){
            //这个if语句执行的是如果b等于25，则提前结束当前的
            //while循环，无论b的值是否大于30
            if(b == 25){
                break;
            }
            
            //这个if结构的else分支语句执行的是如果b不等于25，则对变量b加1
            //然后不再执行后续循环体的代码转而重新开始一轮循环
            else{
                //自加运算，每次执行自加运算都会使变量b自加1，通常在while循环
                //结构内会通过变量的自加来达到结束循环的条件
                b++;
                continue;
            }
        }
    }
}