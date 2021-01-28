contract C {
    function f(uint x) external payable returns (uint) { return 1; }
    function f(uint x, uint y) external payable returns (uint) { return 2; }
    function call() public payable returns (uint v, uint x, uint y, uint z) {
        v = this.f{value: 10}(2);
        x = this.f{gas: 1000}(2, 3);
        y = this.f{gas: 1000, value: 10}(2, 3);
        z = this.f{value: 10, gas: 1000}(2, 3);
    }
    function bal() external returns (uint) { return address(this).balance; }
    receive() external payable {}
}
// ====
// compileViaYul: also
// ----
// (), 1 ether
// gas Legacy: 21055
// gas LegacyOptimized: 21055
// gas Yul: 21067
// gas YulOptimized: 21067
// call() -> 1, 2, 2, 2
// gas Legacy: 53169
// gas LegacyOptimized: 49632
// gas Yul: 50779
// gas YulOptimized: 50779
// bal() -> 1000000000000000000
// gas Legacy: 21425
// gas LegacyOptimized: 21316
// gas Yul: 21521
// gas YulOptimized: 21521
