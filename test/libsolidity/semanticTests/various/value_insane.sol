contract helper {
    function getBalance() public payable returns (uint256 myBalance) {
        return address(this).balance;
    }
}


contract test {
    helper h;

    constructor() payable {
        h = new helper();
    }

    function sendAmount(uint256 amount) public returns (uint256 bal) {
        return h.getBalance{value: amount + 3, gas: 1000}();
    }
}

// ====
// compileViaYul: also
// ----
// constructor(), 20 wei ->
// gas Legacy: 306886
// gas LegacyOptimized: 234055
// gas Yul: 404870
// gas YulOptimized: 205322
// sendAmount(uint256): 5 -> 8
// gas Legacy: 31646
// gas LegacyOptimized: 30937
// gas Yul: 33912
// gas YulOptimized: 31020
