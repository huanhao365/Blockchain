pragma solidity ^0.4.25;
contract Ballot {
    
    //����һ�����ڴ洢ͶƱ����Ϣ�Ľṹ��Voter����Voter�У�
    //weight��ĳһͶƱ�˵�Ȩ�أ�voted��ʾ��ͶƱ���Ƿ���ͶƱ��
    //vote�Ǹ�ͶƱ�˶��᰸������ѡ��һ��洢�����᰸�������ţ�
    //delegate��¼����ͶƱ���ڽ�ͶƱȨί�и����˺���ί���˵�
    //�˻���ַ
    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        address delegate;
    }
    
    //����һ���洢�᰸��Ϣ�Ľṹ��Proposal����Proposal�У�
    //name��ʾ�᰸�����ƣ���voteCount��ʾ���᰸�����֧�ֵ�Ʊ��
    struct Proposal {
        bytes32 name;
        uint voteCount;
    }
    
    //chairperson����ͶƱ�����ˣ���һ����ַ�ͱ���
    address chairperson;
    
    //voters��������ͶƱ�ˣ���һ��address��Voter��mapping�ͱ���
    mapping(address => Voter) voters;
    
    //proposals�洢�����᰸����һ��Proposal���͵Ķ�̬��С������
    Proposal[] proposals;
    
    
    //Ballot()�������ڴ���һ���µ�ͶƱ
    function Ballot(bytes32[] ProposalsName) public {
        //chairperson�洢����ͶƱ������
        chairperson = msg.sender;  
        //ͶƱ��������ͶƱʱ��Ȩ����1
        voters[chairperson].weight = 1;

        //��������ProposalsName�Ǵ��ݽ���������ͶƱ�᰸�����ƣ�
        //������Щ���Ʋ���¼��proposals��
        var i = 0;
        while(i < ProposalsName.length){
            proposals.push(Proposal({
                name : ProposalsName[i],
                voteCount : 0
            }));
            i++;
        }
    }
    
    
    //giveRightToVote()����ʵ����ͶƱ�����˽�ͶƱȨ�������˵Ĺ���
    function giveRightToVote(address toVoter) public {
        //���require���ʽ�еĽ����False����ô����ִ�б��ʽ�����
        //����������䣬�����ɴ��˳�ִ��
        require((msg.sender == chairperson) && !voters[toVoter].voted);
        voters[toVoter].weight = 1;
    }
    
    
    //delegate()��������ͶƱ�˿��Խ��Լ���ĳ���᰸��ͶƱȨ���������ˡ�
    //�������ͶƱȨ���˱����Ǻϸ��ͶƱ������
    function delegate(address DelegateTo) public {
        //��sender�洢����ί�еķ�����
        Voter storage sender = voters[msg.sender]; 
        
        //��ί�����Ѿ�Ͷ��Ʊ�����������ֹί�еĴ���
        if (sender.voted){
            return;
        }
        //DelegateTo�Ǻ����Ĳ����������˱�ί���˵��˻���ַ�����
        //��ί���˵��˻���ַ��ί���˵��˻���ַһ�£���Ҳ��ֹί��
        if (DelegateTo == msg.sender) {
            return;
        }
        
        //���ǵ���ί����Ҳ��ͶƱȨί�г�ȥ�����������ʹ��һ��whileѭ��
        //׷��˷Դ�ҵ����յı�ί�з�
        while (voters[DelegateTo].delegate != address(0) && 
        voters[DelegateTo].delegate != msg.sender){
            DelegateTo = voters[DelegateTo].delegate;
        }    
        
        //�������ļ�鹤������ɺ󣬽������޸�sender��voted���Ժ�
        //delegate���ԣ���ʾί�гɹ�
        sender.voted = true;             
        sender.delegate = DelegateTo;    
         
        
        //�����ί�з��Ѿ�ͶƱ��ȥ����ô������ͶƱ���᰸������ί�з�
        //��Ȩ�أ�����ί�з�δ��ƱͶ������ί�з���Ȩ��Ҫ������Ȩ�����
        Voter storage delegated = voters[DelegateTo]; 
        if (delegated.voted){
            proposals[delegated.vote].voteCount += sender.weight;
        }
        else{
            delegated.weight += sender.weight;
        }
    }
    
    
    //vote()����ʵ�ֵ���ͶƱ�Ĺ���
    function vote(uint8 toProposal) public {
        Voter sender = voters[msg.sender];
        
        //ͶƱ���Ѿ�Ͷ��Ʊ������ֹͶƱ
        require(!sender.voted);    
        
        //δ����ͶƱ����Ͷ��Ʊ��������sender��voted����Ϊtrue��
        //vote����ΪtoProposal�������ͶƱ
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
    }
    
    
    //ͨ��getWinnerName()������ȡ��ʤ�᰸������
    function getWinningProposal() public constant 
    returns (uint winningProposal) {
        uint winningVoteCount = 0;
        
        //��ȡ��ʤ�᰸�����Ƶ�˼·�Ǳ��������᰸��ͳ������Ʊ��
        for (uint8 i = 0; i < proposals.length; i++){
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposal = i;
            }
        }
    }
    
    
    //ͨ��getWinnerName()������ȡ��ʤ�ߵ�����
    function getWinnerName() constant
    returns(bytes32 WinnerName){
        //���ݻ�ʤ���᰸�ҵ���ʤ�ߵ�����
        WinnerName = proposals[getWinningProposal()].name;
    }
}