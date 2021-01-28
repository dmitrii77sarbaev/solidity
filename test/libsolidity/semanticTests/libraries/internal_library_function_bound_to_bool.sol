library L {
    function xor(bool a, bool b) internal pure returns (bool) {
        return a != b;
    }
}

contract C {
    using L for bool;

    function foo(bool a, bool b) public returns (bool) {
        return a.xor(b);
    }
}
// ====
// compileViaYul: also
// ----
// foo(bool,bool): true, true -> false
// gas Legacy: 22205
// gas LegacyOptimized: 21861
// gas Yul: 22626
// gas YulOptimized: 21730
// foo(bool,bool): true, false -> true
// gas Legacy: 22193
// gas LegacyOptimized: 21849
// gas Yul: 22614
// gas YulOptimized: 21718
// foo(bool,bool): false, true -> true
// gas Legacy: 22193
// gas LegacyOptimized: 21849
// gas Yul: 22614
// gas YulOptimized: 21718
// foo(bool,bool): false, false -> false
// gas Legacy: 22181
// gas LegacyOptimized: 21837
// gas Yul: 22602
// gas YulOptimized: 21706
