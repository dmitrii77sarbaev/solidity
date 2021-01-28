contract test {
    enum ActionChoices {GoLeft, GoRight, GoStraight}

    constructor() {}

    function getChoiceExp(uint256 x) public returns (uint256 d) {
        choice = ActionChoices(x);
        d = uint256(choice);
    }

    function getChoiceFromSigned(int256 x) public returns (uint256 d) {
        choice = ActionChoices(x);
        d = uint256(choice);
    }

    function getChoiceFromMax() public returns (uint256 d) {
        choice = ActionChoices(type(uint).max);
        d = uint256(choice);
    }

    ActionChoices choice;
}

// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// getChoiceExp(uint256): 2 -> 2
// gas Legacy: 43556
// gas LegacyOptimized: 43218
// gas Yul: 44578
// gas YulOptimized: 42553
// getChoiceExp(uint256): 3 -> FAILURE, hex"4e487b71", 33 # These should throw #
// gas Legacy: 21632
// gas LegacyOptimized: 21455
// gas Yul: 21841
// gas YulOptimized: 21468
// getChoiceFromSigned(int256): -1 -> FAILURE, hex"4e487b71", 33
// gas Legacy: 22048
// gas LegacyOptimized: 21871
// gas Yul: 22257
// gas YulOptimized: 21884
// getChoiceFromMax() -> FAILURE, hex"4e487b71", 33
// gas Legacy: 21254
// gas LegacyOptimized: 21238
// gas Yul: 21548
// gas YulOptimized: 21299
// getChoiceExp(uint256): 2 -> 2 # These should work #
// gas Legacy: 24356
// gas LegacyOptimized: 24018
// gas Yul: 25378
// gas YulOptimized: 23353
// getChoiceExp(uint256): 0 -> 0
// gas Legacy: 24344
// gas LegacyOptimized: 24006
// gas Yul: 25366
// gas YulOptimized: 23341
