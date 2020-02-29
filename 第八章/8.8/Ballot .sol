pragma solidity ^0.4.25;
contract Ballot {
    
    //声明一个用于存储投票人信息的结构体Voter，在Voter中，
    //weight是某一投票人的权重，voted表示该投票人是否已投票，
    //vote是该投票人对提案作出的选择，一般存储的是提案的索引号，
    //delegate记录的是投票人在将投票权委托给他人后，受委托人的
    //账户地址
    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        address delegate;
    }
    
    //声明一个存储提案信息的结构体Proposal，在Proposal中，
    //name表示提案的名称，而voteCount表示该提案所获得支持的票数
    struct Proposal {
        bytes32 name;
        uint voteCount;
    }
    
    //chairperson代表投票发起人，是一个地址型变量
    address chairperson;
    
    //voters代表所有投票人，是一个address到Voter的mapping型变量
    mapping(address => Voter) voters;
    
    //proposals存储所有提案，是一个Proposal类型的动态大小的数组
    Proposal[] proposals;
    
    
    //Ballot()函数用于创建一个新的投票
    function Ballot(bytes32[] ProposalsName) public {
        //chairperson存储的是投票发起人
        chairperson = msg.sender;  
        //投票发起人在投票时的权重是1
        voters[chairperson].weight = 1;

        //函数参数ProposalsName是传递进来的所有投票提案的名称，
        //遍历这些名称并记录到proposals中
        var i = 0;
        while(i < ProposalsName.length){
            proposals.push(Proposal({
                name : ProposalsName[i],
                voteCount : 0
            }));
            i++;
        }
    }
    
    
    //giveRightToVote()函数实现了投票发起人将投票权赋予他人的功能
    function giveRightToVote(address toVoter) public {
        //如果require表达式中的结果是False，那么不再执行表达式后面的
        //其他函数语句，函数由此退出执行
        require((msg.sender == chairperson) && !voters[toVoter].voted);
        voters[toVoter].weight = 1;
    }
    
    
    //delegate()函数允许投票人可以将自己对某个提案的投票权交给其他人。
    //获得这项投票权的人必须是合格的投票参与者
    function delegate(address DelegateTo) public {
        //用sender存储本次委托的发起人
        Voter storage sender = voters[msg.sender]; 
        
        //对委托人已经投过票的情况进行终止委托的处理
        if (sender.voted){
            return;
        }
        //DelegateTo是函数的参数，代表了被委托人的账户地址，如果
        //被委托人的账户地址和委托人的账户地址一致，则也终止委托
        if (DelegateTo == msg.sender) {
            return;
        }
        
        //考虑到被委托人也将投票权委托出去的情况，这里使用一个while循环
        //追根朔源找到最终的被委托方
        while (voters[DelegateTo].delegate != address(0) && 
        voters[DelegateTo].delegate != msg.sender){
            DelegateTo = voters[DelegateTo].delegate;
        }    
        
        //在上述的检查工作都完成后，接下来修改sender的voted属性和
        //delegate属性，表示委托成功
        sender.voted = true;             
        sender.delegate = DelegateTo;    
         
        
        //如果被委托方已经投票出去，那么在他所投票的提案上增加委托方
        //的权重，若被委托方未将票投出，则委托方的权重要和他的权重相加
        Voter storage delegated = voters[DelegateTo]; 
        if (delegated.voted){
            proposals[delegated.vote].voteCount += sender.weight;
        }
        else{
            delegated.weight += sender.weight;
        }
    }
    
    
    //vote()函数实现的是投票的过程
    function vote(uint8 toProposal) public {
        Voter sender = voters[msg.sender];
        
        //投票人已经投过票，则终止投票
        require(!sender.voted);    
        
        //未发现投票人已投过票，则设置sender的voted属性为true，
        //vote属性为toProposal，并完成投票
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
    }
    
    
    //通过getWinnerName()函数获取获胜提案的名称
    function getWinningProposal() public constant 
    returns (uint winningProposal) {
        uint winningVoteCount = 0;
        
        //获取获胜提案的名称的思路是遍历所有提案并统计其总票数
        for (uint8 i = 0; i < proposals.length; i++){
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposal = i;
            }
        }
    }
    
    
    //通过getWinnerName()函数获取获胜者的名字
    function getWinnerName() constant
    returns(bytes32 WinnerName){
        //根据获胜的提案找到获胜者的名字
        WinnerName = proposals[getWinningProposal()].name;
    }
}