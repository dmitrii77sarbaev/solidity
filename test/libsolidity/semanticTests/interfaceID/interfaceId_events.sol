interface HelloWorld {
    function hello() external pure;
    function world(int) external pure;
}

interface HelloWorldWithEvent {
    event Event();
    function hello() external pure;
    function world(int) external pure;
}

contract Test {
    bytes4 public hello_world = type(HelloWorld).interfaceId;
    bytes4 public hello_world_with_event = type(HelloWorldWithEvent).interfaceId;
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// hello_world() -> left(0xc6be8b58)
// gas Legacy: 22232
// gas LegacyOptimized: 22125
// gas Yul: 22806
// gas YulOptimized: 22280
// hello_world_with_event() -> left(0xc6be8b58)
// gas Legacy: 22263
// gas LegacyOptimized: 22114
// gas Yul: 22784
// gas YulOptimized: 22238
