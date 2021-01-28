contract C {
    struct S {
        uint256 a;
        uint256 b;
    }

    function f() public pure returns (uint256 a, uint256 b){
        assembly {
            // Make free memory dirty to check that the struct allocation cleans it up again.
            let freeMem := mload(0x40)
            mstore(freeMem, 42)
            mstore(add(freeMem, 32), 42)
        }
        S memory s;
        return (s.a, s.b);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0, 0
// gas Legacy: 21628
// gas LegacyOptimized: 21443
// gas Yul: 22605
// gas YulOptimized: 21534
