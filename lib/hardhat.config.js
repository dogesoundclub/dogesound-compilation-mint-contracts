"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("dotenv/config");
require("hardhat-typechain");
const config = {
    solidity: {
        compilers: [{
                version: "0.5.6",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200,
                    },
                },
            }, {
                version: "0.8.9",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200,
                    },
                },
            }]
    },
    networks: {
        polygon: {
            url: "https://polygon-rpc.com/",
            accounts: [process.env.ADMIN || ''],
            chainId: 137,
        },
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY
    },
};
exports.default = config;
//# sourceMappingURL=hardhat.config.js.map