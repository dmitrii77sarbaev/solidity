contract test {
    enum ActionChoices {GoLeft, GoRight, GoStraight, Sit}

    constructor() {
        choices = ActionChoices.GoStraight;
    }

    function getChoice() public returns (uint256 d) {
        d = uint256(choices);
    }

    ActionChoices choices;
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getChoice() -> 2
// gas Legacy: 22241
// gas LegacyOptimized: 22110
// gas Yul: 22895
// gas YulOptimized: 22242
