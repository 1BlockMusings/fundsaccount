pragma solidity 0.4.18;

contract FundsAccount {
    
    address client;
    //create a public variable to display startTime
    uint public startTime;
    //create a public variable to display endTime
    uint public endTime;
    
    function FundsAccount(){
      uint duration = 175;
      client = msg.sender;
      startTime = now;
      //create and endTime by adding the require amount of seconds to startTime 
      endTime = startTime + duration;
  }
  
  function timeRemainingmins () constant returns (uint) {
      uint Timeleft = (endTime - now)/60;
  return Timeleft;
  // output Timeleft until time you can withdraw from the contrat
  }
    function FundsWithdrawal(uint _amount) returns (bool){
        //check that the client is executing the function,
        //the contract is holding an amount equal or greater to the request,
        //and the endTime has passed
        require(msg.sender == client &&
                this.balance >= _amount &&
                now > endTime);
        //transfer requested amount to client
        msg.sender.transfer(_amount);
        return true;
    }
}
