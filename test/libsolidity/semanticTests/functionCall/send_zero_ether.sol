// Sending zero ether to a contract should still invoke the receive ether function
// (it previously did not because the gas stipend was not provided by the EVM)
contract Receiver {
    receive() external payable {}
}


contract Main {
    constructor() payable {}

    function s() public returns (bool) {
        Receiver r = new Receiver();
        return payable(r).send(0);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// constructor(), 20 wei ->
// gas Legacy: 157527
// gas LegacyOptimized: 144003
// gas Yul: 217860
// gas YulOptimized: 125216
// s() -> true
// gas Legacy: 76409
// gas LegacyOptimized: 76303
// gas Yul: 66591
// gas YulOptimized: 57964
