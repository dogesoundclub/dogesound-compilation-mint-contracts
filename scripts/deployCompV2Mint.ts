import hardhat from "hardhat";

async function main() {
    console.log("deploy start")

    const CompV2Mint = await hardhat.ethers.getContractFactory("CompV2Mint")
    const mint = await CompV2Mint.deploy("0xf8915acc665a62e5cfb3188c8fc1f86ff3984eb5", "0x5085a6879Af6767732c51CA0fc7422d41d9aAEf6")
    console.log(`CompV2Mint address: ${mint.address}`)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
