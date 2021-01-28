abstract contract I
{
    function a() internal view virtual returns(uint256);
}
abstract contract V is I
{
    function b() public view returns(uint256) { return a(); }
}
contract C is V
{
    function a() internal view override returns (uint256) { return 42;}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// b() -> 42
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 21928
// gas YulOptimized: 21229
