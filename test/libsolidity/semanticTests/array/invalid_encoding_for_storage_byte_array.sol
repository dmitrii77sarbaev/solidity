contract C {
    bytes public x = "abc";
    bytes public y;
    function invalidateXShort() public {
        assembly { sstore(x.slot, 64) }
        delete y;
    }
    function invalidateXLong() public {
        assembly { sstore(x.slot, 5) }
        delete y;
    }
    function abiEncode() public view returns (bytes memory) { return x; }
    function abiEncodePacked() public view returns (bytes memory) { return abi.encodePacked(x); }
    function copyToMemory() public view returns (bytes memory m) { m = x; }
    function indexAccess() public view returns (bytes1) { return x[0]; }
    function assignTo() public { x = "def"; }
    function assignToLong() public { x = "1234567890123456789012345678901234567"; }
    function copyToStorage() public { y = x; }
    function copyFromStorageShort() public { y = "abc"; x = y; }
    function copyFromStorageLong() public { y = "1234567890123456789012345678901234567"; x = y; }
    function arrayPop() public { x.pop(); }
    function arrayPush() public { x.push("t"); }
    function arrayPushEmpty() public { x.push(); }
    function del() public { delete x; }
}
// ====
// compileViaYul: also
// ----
// x() -> 0x20, 3, 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24643
// gas LegacyOptimized: 24383
// gas Yul: 23598
// gas YulOptimized: 22990
// abiEncode() -> 0x20, 3, 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24716
// gas LegacyOptimized: 24456
// gas Yul: 23765
// gas YulOptimized: 23069
// abiEncodePacked() -> 0x20, 3, 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 23083
// gas LegacyOptimized: 22699
// gas Yul: 23619
// gas YulOptimized: 23001
// copyToMemory() -> 0x20, 3, 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24672
// gas LegacyOptimized: 24412
// gas Yul: 23721
// gas YulOptimized: 23025
// indexAccess() -> 0x6100000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24027
// gas LegacyOptimized: 23945
// gas Yul: 24063
// gas YulOptimized: 23527
// arrayPushEmpty()
// gas Legacy: 24681
// gas LegacyOptimized: 23867
// gas Yul: 25145
// gas YulOptimized: 24672
// arrayPush()
// gas Legacy: 25651
// gas LegacyOptimized: 25615
// gas Yul: 23753
// gas YulOptimized: 23373
// x() -> 0x20, 5, 0x6162630074000000000000000000000000000000000000000000000000000000
// gas Legacy: 24643
// gas LegacyOptimized: 24383
// gas Yul: 23598
// gas YulOptimized: 22990
// arrayPop()
// gas Legacy: 23189
// gas LegacyOptimized: 23168
// gas Yul: 23965
// gas YulOptimized: 23613
// assignToLong()
// gas Legacy: 63524
// gas LegacyOptimized: 63509
// gas Yul: 64653
// gas YulOptimized: 63980
// x() -> 0x20, 0x25, 0x3132333435363738393031323334353637383930313233343536373839303132, 0x3334353637000000000000000000000000000000000000000000000000000000
// gas Legacy: 25636
// gas LegacyOptimized: 25380
// gas Yul: 25558
// gas YulOptimized: 24927
// assignTo()
// gas Legacy: 25040
// gas LegacyOptimized: 25008
// gas Yul: 29095
// gas YulOptimized: 25804
// x() -> 0x20, 3, 0x6465660000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24643
// gas LegacyOptimized: 24383
// gas Yul: 23598
// gas YulOptimized: 22990
// copyFromStorageShort()
// gas Legacy: 47160
// gas LegacyOptimized: 47117
// gas Yul: 47997
// gas YulOptimized: 46959
// x() -> 0x20, 3, 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24643
// gas LegacyOptimized: 24383
// gas Yul: 23598
// gas YulOptimized: 22990
// copyFromStorageLong()
// gas Legacy: 69950
// gas LegacyOptimized: 69904
// gas Yul: 71722
// gas YulOptimized: 70807
// x() -> 0x20, 0x25, 0x3132333435363738393031323334353637383930313233343536373839303132, 0x3334353637000000000000000000000000000000000000000000000000000000
// gas Legacy: 25636
// gas LegacyOptimized: 25380
// gas Yul: 25558
// gas YulOptimized: 24927
// copyToStorage()
// gas Legacy: 27579
// gas LegacyOptimized: 27559
// gas Yul: 28632
// gas YulOptimized: 28213
// x() -> 0x20, 0x25, 0x3132333435363738393031323334353637383930313233343536373839303132, 0x3334353637000000000000000000000000000000000000000000000000000000
// gas Legacy: 25636
// gas LegacyOptimized: 25380
// gas Yul: 25558
// gas YulOptimized: 24927
// y() -> 0x20, 0x25, 0x3132333435363738393031323334353637383930313233343536373839303132, 0x3334353637000000000000000000000000000000000000000000000000000000
// gas Legacy: 25679
// gas LegacyOptimized: 25423
// gas Yul: 25778
// gas YulOptimized: 25147
// del()
// gas Legacy: 24940
// gas LegacyOptimized: 24909
// gas Yul: 28163
// gas YulOptimized: 25377
// x() -> 0x20, 0x00
// gas Legacy: 23674
// gas LegacyOptimized: 23404
// gas Yul: 23501
// gas YulOptimized: 22875
// invalidateXLong()
// gas Legacy: 25724
// gas LegacyOptimized: 25699
// gas Yul: 28859
// gas YulOptimized: 26073
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// abiEncode() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22230
// gas LegacyOptimized: 22213
// gas Yul: 22580
// gas YulOptimized: 22357
// abiEncodePacked() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22291
// gas LegacyOptimized: 22247
// gas Yul: 22445
// gas YulOptimized: 22261
// copyToMemory() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22186
// gas LegacyOptimized: 22169
// gas Yul: 22536
// gas YulOptimized: 22313
// indexAccess() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22167
// gas LegacyOptimized: 22150
// gas Yul: 22424
// gas YulOptimized: 22298
// arrayPushEmpty() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22169
// gas LegacyOptimized: 22152
// gas Yul: 22524
// gas YulOptimized: 22450
// arrayPush() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22212
// gas LegacyOptimized: 22195
// gas Yul: 22343
// gas YulOptimized: 22230
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// arrayPop() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22185
// gas LegacyOptimized: 22165
// gas Yul: 22540
// gas YulOptimized: 22472
// assignToLong() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22301
// gas LegacyOptimized: 22281
// gas Yul: 22954
// gas YulOptimized: 22534
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// assignTo() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22290
// gas LegacyOptimized: 22268
// gas Yul: 23112
// gas YulOptimized: 22659
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// copyFromStorageShort() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 25277
// gas LegacyOptimized: 25236
// gas Yul: 26506
// gas YulOptimized: 25752
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// copyFromStorageLong() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 27068
// gas LegacyOptimized: 27017
// gas Yul: 28329
// gas YulOptimized: 27657
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// copyToStorage() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22167
// gas LegacyOptimized: 22150
// gas Yul: 22550
// gas YulOptimized: 22403
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// y() -> 0x20, 0x00
// gas Legacy: 23717
// gas LegacyOptimized: 23447
// gas Yul: 23721
// gas YulOptimized: 23095
// del() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22253
// gas LegacyOptimized: 22230
// gas Yul: 22593
// gas YulOptimized: 22469
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22162
// gas LegacyOptimized: 22145
// gas Yul: 22411
// gas YulOptimized: 22253
// invalidateXShort()
// gas Legacy: 23893
// gas LegacyOptimized: 23885
// gas Yul: 23861
// gas YulOptimized: 23559
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// abiEncode() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22244
// gas LegacyOptimized: 22227
// gas Yul: 22594
// gas YulOptimized: 22371
// abiEncodePacked() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22305
// gas LegacyOptimized: 22261
// gas Yul: 22459
// gas YulOptimized: 22275
// copyToMemory() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22200
// gas LegacyOptimized: 22183
// gas Yul: 22550
// gas YulOptimized: 22327
// indexAccess() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22181
// gas LegacyOptimized: 22164
// gas Yul: 22438
// gas YulOptimized: 22312
// arrayPushEmpty() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22183
// gas LegacyOptimized: 22166
// gas Yul: 22538
// gas YulOptimized: 22464
// arrayPush() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22226
// gas LegacyOptimized: 22209
// gas Yul: 22357
// gas YulOptimized: 22244
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// arrayPop() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22199
// gas LegacyOptimized: 22179
// gas Yul: 22554
// gas YulOptimized: 22486
// assignToLong() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22315
// gas LegacyOptimized: 22295
// gas Yul: 22968
// gas YulOptimized: 22548
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// assignTo() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22304
// gas LegacyOptimized: 22282
// gas Yul: 23126
// gas YulOptimized: 22673
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// copyFromStorageShort() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 25291
// gas LegacyOptimized: 25250
// gas Yul: 26520
// gas YulOptimized: 25766
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// copyFromStorageLong() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 27082
// gas LegacyOptimized: 27031
// gas Yul: 28343
// gas YulOptimized: 27671
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// copyToStorage() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22181
// gas LegacyOptimized: 22164
// gas Yul: 22564
// gas YulOptimized: 22417
// x() -> FAILURE, hex"4e487b71", 0x22
// gas Legacy: 22176
// gas LegacyOptimized: 22159
// gas Yul: 22425
// gas YulOptimized: 22267
// y() -> 0x20, 0x00
// gas Legacy: 23717
// gas LegacyOptimized: 23447
// gas Yul: 23721
// gas YulOptimized: 23095
