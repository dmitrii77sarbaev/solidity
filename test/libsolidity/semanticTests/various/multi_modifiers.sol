// This triggered a bug in some version because the variable in the modifier was not
// unregistered correctly.
contract C {
    uint256 public x;
    modifier m1 {
        address a1 = msg.sender;
        x++;
        _;
    }

    function f1() public m1() {
        x += 7;
    }

    function f2() public m1() {
        x += 3;
    }
}
// ====
// compileViaYul: also
// ----
// f1() ->
// gas Legacy: 44023
// gas LegacyOptimized: 43821
// gas Yul: 47116
// gas YulOptimized: 43158
// x() -> 0x08
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// f2() ->
// gas Legacy: 24801
// gas LegacyOptimized: 24599
// gas Yul: 27894
// gas YulOptimized: 23936
// x() -> 0x0c
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
