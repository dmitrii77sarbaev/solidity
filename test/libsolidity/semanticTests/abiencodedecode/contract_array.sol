contract C {
  function f(bytes calldata x) public returns (C[] memory) {
    return abi.decode(x, (C[]));
  }
  function g() public returns (bytes memory) {
    C[] memory c = new C[](3);
    c[0] = C(address(0x42));
    c[1] = C(address(0x21));
    c[2] = C(address(0x23));
    return abi.encode(c);
  }
}
// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0xA0, 0x20, 3, 0x01, 0x02, 0x03 -> 0x20, 3, 0x01, 0x02, 0x03
// gas Legacy: 25695
// gas LegacyOptimized: 23814
// gas Yul: 26100
// gas YulOptimized: 23973
// g() -> 0x20, 0xa0, 0x20, 3, 0x42, 0x21, 0x23
// gas Legacy: 23987
// gas LegacyOptimized: 22760
// gas Yul: 27106
// gas YulOptimized: 23249
