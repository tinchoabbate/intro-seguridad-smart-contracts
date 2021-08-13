require("@nomiclabs/hardhat-waffle");

task("accounts", "Imprime la lista de cuentas disponibles", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

module.exports = {
  solidity: {
    compilers: [
      { version: "0.4.18" },
      { version: "0.6.12" },
      { version: "0.7.6" },
      { version: "0.8.7" },
    ]
  }
};
