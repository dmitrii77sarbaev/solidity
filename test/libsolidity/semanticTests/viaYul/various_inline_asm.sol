contract C {
    function f() public pure returns (uint32 x) {
        uint32 a;
        uint32 b;
        uint32 c;
        assembly {
            function myAwesomeFunction(param) -> returnMe {
                let localVar := 10
                returnMe := add(localVar, param)
            }
            let abc := sub(10, a)
            let xyz := 20
            a := abc
            b := myAwesomeFunction(30)
            c := xyz
        }
        x = a + b + c;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 70
// gas Legacy: 21918
// gas LegacyOptimized: 21594
// gas Yul: 22291
// gas YulOptimized: 21559
