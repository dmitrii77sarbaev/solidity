contract Ballot {
	mapping(address => bool) canVote;
	mapping(address => uint) voteCount;
	mapping(address => bool) voted;
	function getVoteCount(address addr) public returns (uint retVoteCount) {
		return voteCount[addr];
	}
	function grantVoteRight(address addr) public {
		canVote[addr] = true;
	}
	function vote(address voter, address vote) public returns (bool success) {
		if (!canVote[voter] || voted[voter]) return false;
		voted[voter] = true;
		voteCount[vote] = voteCount[vote] + 1;
		return true;
	}
}
// ====
// compileViaYul: also
// ----
// getVoteCount(address): 0 -> 0
// gas Legacy: 22755
// gas LegacyOptimized: 22493
// gas Yul: 23466
// gas YulOptimized: 22645
// getVoteCount(address): 1 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// getVoteCount(address): 2 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// vote(address,address): 0, 2 -> false
// gas Legacy: 23166
// gas LegacyOptimized: 22760
// gas Yul: 23930
// gas YulOptimized: 22992
// getVoteCount(address): 0 -> 0
// gas Legacy: 22755
// gas LegacyOptimized: 22493
// gas Yul: 23466
// gas YulOptimized: 22645
// getVoteCount(address): 1 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// getVoteCount(address): 2 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// grantVoteRight(address): 0 ->
// gas Legacy: 42604
// gas LegacyOptimized: 42405
// gas Yul: 43411
// gas YulOptimized: 42553
// grantVoteRight(address): 1 ->
// gas Legacy: 42616
// gas LegacyOptimized: 42417
// gas Yul: 43423
// gas YulOptimized: 42565
// vote(address,address): 0, 2 -> true
// gas Legacy: 66232
// gas LegacyOptimized: 65627
// gas Yul: 69641
// gas YulOptimized: 65842
// getVoteCount(address): 0 -> 0
// gas Legacy: 22755
// gas LegacyOptimized: 22493
// gas Yul: 23466
// gas YulOptimized: 22645
// getVoteCount(address): 1 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// getVoteCount(address): 2 -> 1
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// vote(address,address): 0, 1 -> false
// gas Legacy: 24097
// gas LegacyOptimized: 23658
// gas Yul: 25232
// gas YulOptimized: 23887
// getVoteCount(address): 0 -> 0
// gas Legacy: 22755
// gas LegacyOptimized: 22493
// gas Yul: 23466
// gas YulOptimized: 22645
// getVoteCount(address): 1 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// getVoteCount(address): 2 -> 1
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// vote(address,address): 2, 1 -> false
// gas Legacy: 23178
// gas LegacyOptimized: 22772
// gas Yul: 23942
// gas YulOptimized: 23004
// getVoteCount(address): 0 -> 0
// gas Legacy: 22755
// gas LegacyOptimized: 22493
// gas Yul: 23466
// gas YulOptimized: 22645
// getVoteCount(address): 1 -> 0
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// getVoteCount(address): 2 -> 1
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// grantVoteRight(address): 2 ->
// gas Legacy: 42616
// gas LegacyOptimized: 42417
// gas Yul: 43423
// gas YulOptimized: 42565
// vote(address,address): 2, 1 -> true
// gas Legacy: 66244
// gas LegacyOptimized: 65639
// gas Yul: 69653
// gas YulOptimized: 65854
// getVoteCount(address): 0 -> 0
// gas Legacy: 22755
// gas LegacyOptimized: 22493
// gas Yul: 23466
// gas YulOptimized: 22645
// getVoteCount(address): 1 -> 1
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
// getVoteCount(address): 2 -> 1
// gas Legacy: 22767
// gas LegacyOptimized: 22505
// gas Yul: 23478
// gas YulOptimized: 22657
