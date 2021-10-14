const Fruitshop = artifacts.require("Fruitshop");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Fruitshop", function (/* accounts */) {
  it("should assert true", async function () {
    await Fruitshop.deployed();
    return assert.isTrue(true);
  });
});
