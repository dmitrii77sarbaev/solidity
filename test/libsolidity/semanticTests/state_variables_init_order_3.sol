contract A {
    uint public a = 42;
    uint public b;
    uint public c;
    constructor(uint x) {
        b = a;
        a = x;
    }
    function f(uint x) public returns (uint256) { c = x * 3;  return 23; }
}
contract B is A {
    uint public d = f(a);
    uint public e = b;
    uint public b_a;
    uint public b_b;
    uint public b_c;
    constructor() A(17) { b_a = a; b_b = b; b_c = c; }
}
// ====
// compileViaYul: true
// ----
// a() -> 17
// gas Yul: 22722
// gas YulOptimized: 22243
// b() -> 42
// gas Yul: 22744
// gas YulOptimized: 22265
// c() -> 51
// gas Yul: 22810
// gas YulOptimized: 22331
// b_a() -> 17
// gas Yul: 22854
// gas YulOptimized: 22375
// b_b() -> 42
// gas Yul: 22832
// gas YulOptimized: 22353
// b_c() -> 51
// gas Yul: 22876
// gas YulOptimized: 22397
// d() -> 23
// gas Yul: 22766
// gas YulOptimized: 22287
// e() -> 42
// gas Yul: 22898
// gas YulOptimized: 22419
