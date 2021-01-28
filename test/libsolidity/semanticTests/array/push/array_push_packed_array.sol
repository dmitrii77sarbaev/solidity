contract c {
    uint80[] x;

    function test() public returns (uint80, uint80, uint80, uint80) {
        x.push(1);
        x.push(2);
        x.push(3);
        x.push(4);
        x.push(5);
        x.pop();
        return (x[0], x[1], x[2], x[3]);
    }
}

// ====
// compileViaYul: also
// ----
// test() -> 1, 2, 3, 4
// gas Legacy: 107098
// gas LegacyOptimized: 106398
// gas Yul: 117283
// gas YulOptimized: 112771
