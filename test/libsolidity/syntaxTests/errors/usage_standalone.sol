error E();
function f() pure {
    E();
}
// ----
// TypeError 7756: (35-38): Errors can only be created directly inside require or revert calls.
