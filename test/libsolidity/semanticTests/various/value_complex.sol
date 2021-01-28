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

    function sendAmount(uint256 amount) public payable returns (uint256 bal) {
        uint256 someStackElement = 20;
        return h.getBalance{value: amount + 3, gas: 1000}();
    }
}

// ====
// compileViaYul: also
// ----
// constructor(), 20 wei ->
// gas Legacy: 305175
// gas LegacyOptimized: 232117
// gas Yul: 402314
// gas YulOptimized: 203162
// sendAmount(uint256): 5 -> 8
// gas Legacy: 31632
// gas LegacyOptimized: 30921
// gas Yul: 33893
// gas YulOptimized: 31001
