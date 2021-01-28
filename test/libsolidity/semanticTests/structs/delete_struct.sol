contract test {
    struct topStruct {
        nestedStruct nstr;
        uint topValue;
        mapping (uint => uint) topMapping;
    }
    uint toDelete;
    topStruct str;
    struct nestedStruct {
        uint nestedValue;
        mapping (uint => bool) nestedMapping;
    }
    constructor() {
        toDelete = 5;
        str.topValue = 1;
        str.topMapping[0] = 1;
        str.topMapping[1] = 2;

        str.nstr.nestedValue = 2;
        str.nstr.nestedMapping[0] = true;
        str.nstr.nestedMapping[1] = false;
        delete str;
        delete toDelete;
    }
    function getToDelete() public returns (uint res){
        res = toDelete;
    }
    function getTopValue() public returns(uint topValue){
        topValue = str.topValue;
    }
    function getNestedValue() public returns(uint nestedValue){
        nestedValue = str.nstr.nestedValue;
    }
    function getTopMapping(uint index) public returns(uint ret) {
        ret = str.topMapping[index];
    }
    function getNestedMapping(uint index) public returns(bool ret) {
        return str.nstr.nestedMapping[index];
    }
}
// ====
// compileViaYul: also
// ----
// getToDelete() -> 0
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22743
// gas YulOptimized: 22243
// getTopValue() -> 0
// gas Legacy: 22229
// gas LegacyOptimized: 22114
// gas Yul: 22793
// gas YulOptimized: 22287
// getNestedValue() -> 0 #mapping values should be the same#
// gas Legacy: 22213
// gas LegacyOptimized: 22092
// gas Yul: 22777
// gas YulOptimized: 22265
// getTopMapping(uint256): 0 -> 1
// gas Legacy: 22744
// gas LegacyOptimized: 22429
// gas Yul: 23348
// gas YulOptimized: 22583
// getTopMapping(uint256): 1 -> 2
// gas Legacy: 22756
// gas LegacyOptimized: 22441
// gas Yul: 23360
// gas YulOptimized: 22595
// getNestedMapping(uint256): 0 -> true
// gas Legacy: 22770
// gas LegacyOptimized: 22419
// gas Yul: 23344
// gas YulOptimized: 22573
// getNestedMapping(uint256): 1 -> false
// gas Legacy: 22782
// gas LegacyOptimized: 22431
// gas Yul: 23356
// gas YulOptimized: 22585
