interface ERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface Simpson {
    function is2D() external returns (bool);
    function skinColor() external returns (string memory);
}

contract Homer is ERC165, Simpson {
    function supportsInterface(bytes4 interfaceID) external view override returns (bool) {
        return
            interfaceID == this.supportsInterface.selector || // ERC165
            interfaceID == this.is2D.selector ^ this.skinColor.selector; // Simpson
    }

    function is2D() external override returns (bool) {
        return true;
    }

    function skinColor() external override returns (string memory) {
        return "yellow";
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// supportsInterface(bytes4): left(0x01ffc9a0) -> false
// gas Legacy: 21926
// gas LegacyOptimized: 21676
// gas Yul: 22853
// gas YulOptimized: 21806
// supportsInterface(bytes4): left(0x01ffc9a7) -> true
// gas Legacy: 21879
// gas LegacyOptimized: 21638
// gas Yul: 22428
// gas YulOptimized: 21786
// supportsInterface(bytes4): left(0x73b6b492) -> true
// gas Legacy: 21926
// gas LegacyOptimized: 21676
// gas Yul: 22853
// gas YulOptimized: 21806
// supportsInterface(bytes4): left(0x70b6b492) -> false
// gas Legacy: 21926
// gas LegacyOptimized: 21676
// gas Yul: 22853
// gas YulOptimized: 21806
