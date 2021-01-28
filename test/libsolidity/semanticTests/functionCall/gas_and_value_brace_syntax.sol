contract helper {
    bool flag;

    function getBalance() payable public returns(uint256 myBalance) {
        return address(this).balance;
    }

    function setFlag() public {
        flag = true;
    }

    function getFlag() public returns(bool fl) {
        return flag;
    }
}
contract test {
    helper h;
    constructor() payable {
        h = new helper();
    }

    function sendAmount(uint amount) public payable returns(uint256 bal) {
        return h.getBalance{value: amount}();
    }

    function outOfGas() public returns(bool ret) {
        h.setFlag {
            gas: 2
        }(); // should fail due to OOG
        return true;
    }

    function checkState() public returns(bool flagAfter, uint myBal) {
        flagAfter = h.getFlag();
        myBal = address(this).balance;
    }
}

// ====
// compileViaYul: also
// ----
// constructor(), 20 wei ->
// gas Legacy: 445151
// gas LegacyOptimized: 334361
// gas Yul: 637083
// gas YulOptimized: 357022
// sendAmount(uint256): 5 -> 5
// gas Legacy: 31463
// gas LegacyOptimized: 30929
// gas Yul: 33558
// gas YulOptimized: 31260
// outOfGas() -> FAILURE # call to helper should not succeed but amount should be transferred anyway #
// gas Legacy: 23568
// gas LegacyOptimized: 23592
// gas Yul: 24247
// gas YulOptimized: 23587
// checkState() -> false, 15
// gas Legacy: 25388
// gas LegacyOptimized: 24935
// gas Yul: 27761
// gas YulOptimized: 25350
