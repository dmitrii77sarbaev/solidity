interface Parent {
    function parentFun() external returns (uint256);
}

interface SubA is Parent {
    function subAFun() external returns (uint256);
}

interface SubB is Parent {
    function subBFun() external returns (uint256);
}

contract Impl is SubA, SubB {
    function parentFun() override external returns (uint256) { return 1; }
    function subAFun() override external returns (uint256) { return 2; }
    function subBFun() override external returns (uint256) { return 3; }
}

contract C {
    function convertParent() public returns (uint256) {
        Parent p = new Impl();
        return p.parentFun();
    }

    function convertSubA() public returns (uint256, uint256) {
        SubA sa = new Impl();
        return (sa.parentFun(), sa.subAFun());
    }

    function convertSubB() public returns (uint256, uint256) {
        SubB sb = new Impl();
        return (sb.parentFun(), sb.subBFun());
    }
}

// ====
// compileViaYul: also
// ----
// convertParent() -> 1
// gas Legacy: 118425
// gas LegacyOptimized: 99829
// gas Yul: 183986
// gas YulOptimized: 122356
// convertSubA() -> 1, 2
// gas Legacy: 120739
// gas LegacyOptimized: 101802
// gas Yul: 187032
// gas YulOptimized: 124555
// convertSubB() -> 1, 3
// gas Legacy: 120673
// gas LegacyOptimized: 101736
// gas Yul: 186966
// gas YulOptimized: 124489
