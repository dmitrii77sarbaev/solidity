library L {
    function transfer(address a) internal {}
    function send(address a) internal {}
}

contract C {
    using L for address;

    function useTransfer(address a) public {
        a.transfer();
    }

    function useSend(address a) public {
        a.send();
    }
}
// ====
// compileViaYul: also
// ----
// useTransfer(address): 0x111122223333444455556666777788889999aAaa ->
// gas Legacy: 21922
// gas LegacyOptimized: 21737
// gas Yul: 22205
// gas YulOptimized: 21822
// useSend(address): 0x111122223333444455556666777788889999aAaa ->
// gas Legacy: 21900
// gas LegacyOptimized: 21715
// gas Yul: 22183
// gas YulOptimized: 21800
