contract C {
    function f1(bytes calldata c1, uint256 s, uint256 e, bytes calldata c2) public returns (bool) {
        return keccak256(c1[s:e]) == keccak256(c2);
    }

    function f2(bytes calldata c, uint256 s) public returns (uint256, bytes memory) {
        return abi.decode(c[s:], (uint256, bytes));
    }

    function f3(bytes calldata c1, uint256 s, uint256 e, bytes calldata c2) public returns (bool) {
        bytes memory a = abi.encode(c1[s:e]);
        bytes memory b = abi.encode(c2);
        if (a.length != b.length) { return false; }
        for (uint256 i = 0; i < a.length; i++) {
            if (a[i] != b[i]) { return false; }
        }
        return true;
    }

    function f4(bytes calldata c1, uint256 s, uint256 e, bytes calldata c2) public returns (bool) {
        bytes memory a = abi.encodePacked(c1[s:e]);
        bytes memory b = abi.encodePacked(c2);
        if (a.length != b.length) { return false; }
        for (uint256 i = 0; i < a.length; i++) {
            if (a[i] != b[i]) { return false; }
        }
        return true;
    }
}
// ====
// compileViaYul: also
// ----
// f1(bytes,uint256,uint256,bytes): 0x80, 1, 5, 0xC0, 8, "abcdefgh", 4, "bcde" -> true
// gas Legacy: 24332
// gas LegacyOptimized: 23533
// gas Yul: 25633
// gas YulOptimized: 24240
// f1(bytes,uint256,uint256,bytes): 0x80, 1, 5, 0xC0, 8, "abcdefgh", 4, "bcdf" -> false
// gas Legacy: 24332
// gas LegacyOptimized: 23533
// gas Yul: 25633
// gas YulOptimized: 24240
// f2(bytes,uint256): 0x40, 0, 0x80, 0x21, 0x40, 0x7, "abcdefg" -> 0x21, 0x40, 0x7, "abcdefg"
// gas Legacy: 24586
// gas LegacyOptimized: 23527
// gas Yul: 25026
// gas YulOptimized: 23786
// f3(bytes,uint256,uint256,bytes): 0x80, 1, 5, 0xC0, 8, "abcdefgh", 4, "bcde" -> true
// gas Legacy: 56242
// gas LegacyOptimized: 50685
// gas Yul: 122068
// gas YulOptimized: 77773
// f3(bytes,uint256,uint256,bytes): 0x80, 1, 5, 0xC0, 8, "abcdefgh", 4, "bcdf" -> false
// gas Legacy: 46857
// gas LegacyOptimized: 42766
// gas Yul: 93648
// gas YulOptimized: 62025
// f4(bytes,uint256,uint256,bytes): 0x80, 1, 5, 0xC0, 8, "abcdefgh", 4, "bcde" -> true
// gas Legacy: 25737
// gas LegacyOptimized: 24730
// gas Yul: 29556
// gas YulOptimized: 26379
// f4(bytes,uint256,uint256,bytes): 0x80, 1, 5, 0xC0, 8, "abcdefgh", 4, "bcdf" -> false
// gas Legacy: 25564
// gas LegacyOptimized: 24623
// gas Yul: 29220
// gas YulOptimized: 26227
