import hardhat from "hardhat";

async function main() {
    console.log("deploy start")

    const CompMint = await hardhat.ethers.getContractFactory("CompMint")
    const mint = await CompMint.deploy("0xf8915acc665a62e5cfb3188c8fc1f86ff3984eb5", "0x5085a6879Af6767732c51CA0fc7422d41d9aAEf6")
    console.log(`CompMint address: ${mint.address}`)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
