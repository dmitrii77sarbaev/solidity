contract C {
    function f() public returns (bytes20) {
        return ripemd160("");
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x9c1185a5c5e9fc54612808977ee8f548b2258d31000000000000000000000000
// gas Legacy: 22349
// gas LegacyOptimized: 22099
// gas Yul: 22768
// gas YulOptimized: 22162
