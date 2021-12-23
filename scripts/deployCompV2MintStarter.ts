import hardhat from "hardhat";

async function main() {
    console.log("deploy start")

    const CompV2MintStarter = await hardhat.ethers.getContractFactory("CompV2MintStarter")
    const starter = await CompV2MintStarter.deploy()
    console.log(`CompV2MintStarter address: ${starter.address}`)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
