interface HelloWorld {
    function hello() external pure;
    function world(int) external pure;
}

interface HelloWorldDerived is HelloWorld {
    function other() external pure;
}

interface ERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

contract Test {
    bytes4 public ghello_world_interfaceId = type(HelloWorld).interfaceId;
    bytes4 public ERC165_interfaceId = type(ERC165).interfaceId;

    function hello() public pure returns (bytes4 data){
        HelloWorld i;
        return i.hello.selector;
    }

    function world() public pure returns (bytes4 data){
        HelloWorld i;
        return i.world.selector;
    }

    function hello_world() public pure returns (bytes4 data){
        // HelloWorld i;
        // return i.hello.selector ^ i.world.selector; // = 0xc6be8b58
        return 0xc6be8b58;
    }

    function hello_world_interfaceId() public pure returns (bytes4 data){
        return type(HelloWorld).interfaceId;
    }

    function other() public pure returns (bytes4 data){
        HelloWorldDerived i;
        return i.other.selector;
    }

    function hello_world_derived_interfaceId() public pure returns (bytes4 data){
        return type(HelloWorldDerived).interfaceId;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// hello() -> left(0x19ff1d21)
// gas Legacy: 21441
// gas LegacyOptimized: 21348
// gas Yul: 21988
// gas YulOptimized: 21480
// world() -> left(0xdf419679)
// gas Legacy: 21485
// gas LegacyOptimized: 21392
// gas Yul: 22032
// gas YulOptimized: 21524
// ERC165_interfaceId() -> left(0x01ffc9a7)
// gas Legacy: 22329
// gas LegacyOptimized: 22180
// gas Yul: 22916
// gas YulOptimized: 22405
// hello_world() -> left(0xc6be8b58)
// gas Legacy: 21479
// gas LegacyOptimized: 21391
// gas Yul: 22065
// gas YulOptimized: 21612
// hello_world_interfaceId() -> left(0xc6be8b58)
// gas Legacy: 21408
// gas LegacyOptimized: 21326
// gas Yul: 21779
// gas YulOptimized: 21458
// ghello_world_interfaceId() -> left(0xc6be8b58)
// gas Legacy: 22232
// gas LegacyOptimized: 22125
// gas Yul: 22872
// gas YulOptimized: 22349
// other() -> left(0x85295877)
// gas Legacy: 21440
// gas LegacyOptimized: 21347
// gas Yul: 22076
// gas YulOptimized: 21568
// hello_world_derived_interfaceId() -> left(0x85295877)
// gas Legacy: 21452
// gas LegacyOptimized: 21370
// gas Yul: 21823
// gas YulOptimized: 21502
