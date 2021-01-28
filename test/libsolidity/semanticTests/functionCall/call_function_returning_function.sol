contract test {
    function f0() public returns (uint) {
        return 2;
    }

    function f1() internal returns (function() internal returns (uint)) {
        return f0;
    }

    function f2() internal returns (function() internal returns (function () internal returns (uint))) {
        return f1;
    }

    function f3() internal returns (function() internal returns (function () internal returns (function () internal returns (uint)))) {
        return f2;
    }

    function f() public returns (uint) {
        function() internal returns(function() internal returns(function() internal returns(function() internal returns(uint)))) x;
        x = f3;
        return x()()()();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21556
// gas LegacyOptimized: 21415
// gas Yul: 22683
// gas YulOptimized: 21865
