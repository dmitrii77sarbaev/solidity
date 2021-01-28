// This tests a swap in storage which does not work as one
// might expect because we do not have temporary storage.
// (x, y) = (y, x) is the same as
// y = x;
// x = y;
contract c {
    struct S {
        uint256 a;
        uint256 b;
    }
    S public x;
    S public y;

    function set() public {
        x.a = 1;
        x.b = 2;
        y.a = 3;
        y.b = 4;
    }

    function swap() public {
        (x, y) = (y, x);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 0, 0
// gas Legacy: 23097
// gas LegacyOptimized: 22891
// gas Yul: 23809
// gas YulOptimized: 23113
// y() -> 0, 0
// gas Legacy: 23141
// gas LegacyOptimized: 22935
// gas Yul: 23853
// gas YulOptimized: 23157
// set() ->
// gas Legacy: 101332
// gas LegacyOptimized: 101294
// gas Yul: 106508
// gas YulOptimized: 101473
// x() -> 1, 2
// gas Legacy: 23097
// gas LegacyOptimized: 22891
// gas Yul: 23809
// gas YulOptimized: 23113
// y() -> 3, 4
// gas Legacy: 23141
// gas LegacyOptimized: 22935
// gas Yul: 23853
// gas YulOptimized: 23157
// swap() ->
// gas Legacy: 27732
// gas LegacyOptimized: 24420
// gas Yul: 33620
// gas YulOptimized: 26239
// x() -> 1, 2
// gas Legacy: 23097
// gas LegacyOptimized: 22891
// gas Yul: 23809
// gas YulOptimized: 23113
// y() -> 1, 2
// gas Legacy: 23141
// gas LegacyOptimized: 22935
// gas Yul: 23853
// gas YulOptimized: 23157
