contract C {
    string public a;
    string public b;
    bytes public c;
    string public d = "abcd";
    constructor() {
        a = "hello world";
        b = hex"41424344";
        c = hex"ff077fff";
    }
}
// ====
// compileViaYul: also
// ----
// a() -> 0x20, 11, "hello world"
// gas Legacy: 24597
// gas LegacyOptimized: 24377
// gas Yul: 23598
// gas YulOptimized: 22911
// b() -> 0x20, 4, "ABCD"
// gas Legacy: 24619
// gas LegacyOptimized: 24399
// gas Yul: 23620
// gas YulOptimized: 22933
// c() -> 0x20, 4, -439061522557375173052089223601630338202760422010735733633791622124826263552
// gas Legacy: 24663
// gas LegacyOptimized: 24443
// gas Yul: 23664
// gas YulOptimized: 22977
// d() -> 0x20, 4, "abcd"
// gas Legacy: 24641
// gas LegacyOptimized: 24421
// gas Yul: 23642
// gas YulOptimized: 22955
