"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const hardhat_1 = __importDefault(require("hardhat"));
async function main() {
    console.log("deploy start");
    const CompV2Mint = await hardhat_1.default.ethers.getContractFactory("CompV2Mint");
    const mint = await CompV2Mint.deploy("0xf8915acc665a62e5cfb3188c8fc1f86ff3984eb5");
    console.log(`CompV2Mint address: ${mint.address}`);
}
main()
    .then(() => process.exit(0))
    .catch(error => {
    console.error(error);
    process.exit(1);
});
//# sourceMappingURL=deployCompV2Mint.js.map