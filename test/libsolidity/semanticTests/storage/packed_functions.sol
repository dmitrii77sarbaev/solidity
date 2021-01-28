contract C {
    // these should take the same slot
    function() internal returns (uint) a;
    function() external returns (uint) b;
    function() external returns (uint) c;
    function() internal returns (uint) d;
    uint8 public x;

    function set() public {
        x = 2;
        d = g;
        c = this.h;
        b = this.h;
        a = g;
    }

    function t1() public returns (uint256) {
        return a();
    }

    function t2() public returns (uint256) {
        return b();
    }

    function t3() public returns (uint256) {
        return a();
    }

    function t4() public returns (uint256) {
        return b();
    }

    function g() public returns (uint256) {
        return 7;
    }

    function h() public returns (uint256) {
        return 8;
    }
}

// ====
// compileViaYul: also
// ----
// set() ->
// gas Legacy: 87350
// gas LegacyOptimized: 83869
// gas Yul: 89632
// gas YulOptimized: 85653
// t1() -> 7
// gas Legacy: 22336
// gas LegacyOptimized: 22197
// gas Yul: 23122
// gas YulOptimized: 22489
// t2() -> 8
// gas Legacy: 24548
// gas LegacyOptimized: 24188
// gas Yul: 25917
// gas YulOptimized: 24521
// t3() -> 7
// gas Legacy: 22292
// gas LegacyOptimized: 22153
// gas Yul: 23078
// gas YulOptimized: 22445
// t4() -> 8
// gas Legacy: 24547
// gas LegacyOptimized: 24187
// gas Yul: 26005
// gas YulOptimized: 24609
// x() -> 2
// gas Legacy: 22236
// gas LegacyOptimized: 22111
// gas Yul: 22734
// gas YulOptimized: 22290
