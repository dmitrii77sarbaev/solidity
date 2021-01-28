contract test {
    bytes2[2] data1;
    function f(bool cond) public returns (uint) {
        data1[0] = "cc";

        bytes2[2] memory x;
        bytes2[2] memory y;
        y[0] = "bb";

        x = cond ? y : data1;

        uint ret = 0;
        if (x[0] == "bb")
        {
            ret = 1;
        }

        if (x[0] == "cc")
        {
            ret = 2;
        }

        return ret;
    }
}
// ====
// compileViaYul: also
// ----
// f(bool): true -> 1
// gas Legacy: 43220
// gas LegacyOptimized: 42726
// gas Yul: 46186
// gas YulOptimized: 43838
// f(bool): false -> 2
// gas Legacy: 26071
// gas LegacyOptimized: 25556
// gas Yul: 29302
// gas YulOptimized: 25641
