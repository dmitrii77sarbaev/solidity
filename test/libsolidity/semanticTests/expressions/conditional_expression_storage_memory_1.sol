contract test {
    bytes2[2] data1;
    function f(bool cond) public returns (uint) {
        bytes2[2] memory x;
        x[0] = "aa";
        bytes2[2] memory y;
        y[0] = "bb";

        data1 = cond ? x : y;

        uint ret = 0;
        if (data1[0] == "aa")
        {
            ret = 1;
        }

        if (data1[0] == "bb")
        {
            ret = 2;
        }

        return ret;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> 1
// gas Legacy: 71867
// gas LegacyOptimized: 71277
// gas Yul: 51184
// gas YulOptimized: 47593
// f(bool): false -> 2
// gas Legacy: 52665
// gas LegacyOptimized: 52075
// gas Yul: 31962
// gas YulOptimized: 28371
