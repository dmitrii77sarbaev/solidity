pragma abicoder               v2;


contract C {
    function f(bool _b) public returns (uint256) {
        if (_b) return 1;
        else return 0;
    }

    function g(bool _in) public returns (bool _out) {
        _out = _in;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): 0x0 -> 0x0
// gas Legacy: 21799
// gas LegacyOptimized: 21540
// gas Yul: 22205
// gas YulOptimized: 21647
// f(bool): 0x1 -> 0x1
// gas Legacy: 21821
// gas LegacyOptimized: 21562
// gas Yul: 22216
// gas YulOptimized: 21658
// f(bool): 0x2 -> FAILURE
// gas Legacy: 21520
// gas LegacyOptimized: 21400
// gas Yul: 21548
// gas YulOptimized: 21410
// f(bool): 0x3 -> FAILURE
// gas Legacy: 21520
// gas LegacyOptimized: 21400
// gas Yul: 21548
// gas YulOptimized: 21410
// f(bool): 0xff -> FAILURE
// gas Legacy: 21520
// gas LegacyOptimized: 21400
// gas Yul: 21548
// gas YulOptimized: 21410
// g(bool): 0x0 -> 0x0
// gas Legacy: 21806
// gas LegacyOptimized: 21534
// gas Yul: 22106
// gas YulOptimized: 21592
// g(bool): 0x1 -> 0x1
// gas Legacy: 21818
// gas LegacyOptimized: 21546
// gas Yul: 22118
// gas YulOptimized: 21604
// g(bool): 0x2 -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21422
// gas Yul: 21570
// gas YulOptimized: 21429
// g(bool): 0x3 -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21422
// gas Yul: 21570
// gas YulOptimized: 21429
// g(bool): 0xff -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21422
// gas Yul: 21570
// gas YulOptimized: 21429
