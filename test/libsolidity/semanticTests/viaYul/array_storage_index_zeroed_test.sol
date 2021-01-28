contract C {
    uint[] storageArray;
    function test_zeroed_indicies(uint256 len) public
    {
        while(storageArray.length < len)
            storageArray.push();
        while(storageArray.length > len)
            storageArray.pop();

        for (uint i = 0; i < len; i++)
            storageArray[i] = i + 1;

        if (len > 3)
        {
            while(storageArray.length > 0)
                storageArray.pop();
            while(storageArray.length < 3)
                storageArray.push();

            for (uint i = 3; i < len; i++)
            {
                assembly {
                    mstore(0, storageArray.slot)
                    let pos := add(keccak256(0, 0x20), i)

                    if iszero(eq(sload(pos), 0)) {
                        revert(0, 0)
                    }
                }
            }

        }

        while(storageArray.length > 0)
            storageArray.pop();
        while(storageArray.length < len)
            storageArray.push();

        for (uint i = 0; i < len; i++)
        {
            require(storageArray[i] == 0);

            uint256 val = storageArray[i];
            uint256 check;

            assembly { check := iszero(val) }

            require(check == 1);
        }
    }
}
// ====
// compileViaYul: also
// ----
// test_zeroed_indicies(uint256): 1 ->
// gas Legacy: 77519
// gas LegacyOptimized: 76872
// gas Yul: 86998
// gas YulOptimized: 82335
// test_zeroed_indicies(uint256): 5 ->
// gas Legacy: 191267
// gas LegacyOptimized: 188486
// gas Yul: 243517
// gas YulOptimized: 222625
// test_zeroed_indicies(uint256): 10 ->
// gas Legacy: 276129
// gas LegacyOptimized: 271024
// gas Yul: 363409
// gas YulOptimized: 327375
// test_zeroed_indicies(uint256): 15 ->
// gas Legacy: 339254
// gas LegacyOptimized: 331904
// gas Yul: 460299
// gas YulOptimized: 409400
// test_zeroed_indicies(uint256): 0xFF ->
// gas Legacy: 8477449
// gas LegacyOptimized: 8343774
// gas Yul: 10516489
// gas YulOptimized: 9686975
