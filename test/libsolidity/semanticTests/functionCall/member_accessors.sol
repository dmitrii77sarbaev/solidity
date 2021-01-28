contract test {
    uint256 public data;
    bytes6 public name;
    bytes32 public a_hash;
    address public an_address;
    constructor() {
        data = 8;
        name = "Celina";
        a_hash = keccak256("\x7b");
        an_address = address(0x1337);
        super_secret_data = 42;
    }
    uint256 super_secret_data;
}
// ====
// allowNonExistingFunctions: true
// compileToEwasm: also
// compileViaYul: also
// ----
// data() -> 8
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
// name() -> "Celina"
// gas Legacy: 22213
// gas LegacyOptimized: 22103
// gas Yul: 22784
// gas YulOptimized: 22258
// a_hash() -> 0xa91eddf639b0b768929589c1a9fd21dcb0107199bdd82e55c5348018a1572f52
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22262
// an_address() -> 0x1337
// gas Legacy: 22322
// gas LegacyOptimized: 22178
// gas Yul: 22868
// gas YulOptimized: 22342
// super_secret_data() -> FAILURE
// gas Legacy: 21234
// gas LegacyOptimized: 21234
// gas Yul: 21281
// gas YulOptimized: 21235
