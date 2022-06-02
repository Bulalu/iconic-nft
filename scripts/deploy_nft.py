from brownie import MyIconicNFT, network,config
from scripts.helpful_scripts import get_account


def deploy_iconic_nft():
    account = get_account()
    contract = MyIconicNFT.deploy({"from": account})
    print("Minting new nft 1")
    tx = contract.makeAnIconicNFT({"from": account})
    print(tx.events)
    print("minting nft 2")
    tx = contract.makeAnIconicNFT({"from": account})
    print(tx.events)


def main():
    deploy_iconic_nft()

