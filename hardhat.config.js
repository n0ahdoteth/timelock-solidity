require("@nomicfoundation/hardhat-toolbox");
require("")

/** @type import('hardhat/config').HardhatUserConfig */

const metamask_private_key = "7a676ee53f704b0b4503d916b745ecc538c882f85344227cc73b8a812ac1b4b9";



module.exports = {
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  networks: {
    rinkeby:{
      url: "https://rinkeby.infura.io/v3/12b4fba864ae486bbdd8b81047e27f44",
      accounts: [metamask_private_key]
    }
  },
  etherscan:{
    apiKey: "E6HRSGK5TFRQXRM39EWCRHSV7YCT1Z3G5H",
  },
};