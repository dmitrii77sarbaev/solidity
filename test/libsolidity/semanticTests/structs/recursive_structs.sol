contract C {
    struct S {
        S[] x;
    }
    S sstorage;

    function f() public returns (uint256) {
        S memory s;
        s.x = new S[](10);
        delete s;
        // TODO Uncomment after implemented.
        // sstorage.x.push();
        delete sstorage;
        return 1;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 24562
// gas LegacyOptimized: 24377
// gas Yul: 30153
// gas YulOptimized: 25902
