contract C {
    modifier tryCircumvent {
        if (false) _; // avoid the function, we should still not accept ether
    }
    function f() tryCircumvent public returns (uint) {
        return msgvalue();
    }
    function msgvalue() internal returns (uint) {
        return msg.value;
    }
    // TODO: remove this helper function once isoltest supports balance checking
    function balance() external returns (uint) {
        return address(this).balance;
    }
}
// ====
// compileViaYul: also
// ----
// f(), 27 wei -> FAILURE
// gas Legacy: 21109
// gas LegacyOptimized: 21109
// gas Yul: 21212
// gas YulOptimized: 21171
// balance() -> 0
// gas Legacy: 21403
// gas LegacyOptimized: 21294
// gas Yul: 22632
// gas YulOptimized: 21432
