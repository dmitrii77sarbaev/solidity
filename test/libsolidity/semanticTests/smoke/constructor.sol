contract C {
    uint public state = 0;
    constructor(uint _state) payable {
        state = _state;
    }
    function balance() public payable returns (uint256) {
        return address(this).balance;
    }
    function update(uint _state) public {
        state = _state;
    }
}
// ====
// compileViaYul: also
// ----
// constructor(), 2 wei: 3 ->
// gas Legacy: 168514
// gas LegacyOptimized: 133184
// gas Yul: 276160
// gas YulOptimized: 152784
// state() -> 3
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
// balance() -> 2
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 22613
// gas YulOptimized: 21445
// update(uint256): 4
// gas Legacy: 22402
// gas LegacyOptimized: 22206
// gas Yul: 23835
// gas YulOptimized: 22351
// state() -> 4
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
