library L {
    function equals(address a, address b) internal pure returns (bool) {
        return a == b;
    }
}

contract C {
    using L for address;

    function foo(address a, address b) public returns (bool) {
        return a.equals(b);
    }
}
// ====
// compileViaYul: also
// ----
// foo(address,address): 0x111122223333444455556666777788889999aAaa, 0x111122223333444455556666777788889999aAaa -> true
// gas Legacy: 22744
// gas LegacyOptimized: 22365
// gas Yul: 23303
// gas YulOptimized: 22212
// foo(address,address): 0x111122223333444455556666777788889999aAaa, 0x0000000000000000000000000000000000000000 -> false
// gas Legacy: 22504
// gas LegacyOptimized: 22125
// gas Yul: 23063
// gas YulOptimized: 21972
