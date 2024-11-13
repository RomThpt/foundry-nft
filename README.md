# 🐾 Basic NFT Project - Doggie NFTs 🐾

This Solidity project creates and manages unique NFTs featuring adorable "Doggie" images! Utilizing OpenZeppelin's `ERC721` standard, this smart contract provides functions for minting, deploying, and interacting with NFTs on Ethereum-compatible blockchains.

## 📑 Table of Contents

-   🎨 Features
-   ⚙️ Setup
-   🚀 Deployment
-   🧪 Testing
-   🔍 Project Details
-   📜 License

## 🎨 Features

-   **ERC721 NFT**: Implements a basic `ERC721` contract with the following:
    -   🖼️ Minting NFTs: Allows users to mint a new NFT with a unique token URI.
    -   📂 Token URI Storage: Stores metadata for each NFT in a URI mapping.
-   **Deployment and Interaction Scripts**:
    -   `DeployBasicNft.s.sol`: Script to deploy the `BasicNft` contract.
    -   `Interactions.s.sol`: Script to mint an NFT on the deployed contract.
-   **Unit Testing**:
    -   ✅ Tests the contract's name, minting functionality, and token ownership.

## ⚙️ Setup

To get started with this project, make sure you have the following:

-   **Node.js** and **npm**
-   **Foundry** development environment
-   **Forge** for testing and deployments
-   **OpenZeppelin Contracts** library for `ERC721` standard

**Installation**:

1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/basic-nft-project.git
    cd basic-nft-project
    ```
2. Install dependencies:
    ```bash
    forge install OpenZeppelin/openzeppelin-contracts
    ```

## 🚀 Deployment

### Step 1: Deploy the Contract

To deploy the `BasicNft` contract, run the following command using Foundry:

```bash
make deploy ARGS="--network sepolia"
```

### Step 2: Mint an NFT

Use the `Interactions.s.sol` script to mint an NFT on the deployed contract:

```bash
make mint ARGS="--network sepolia"
```

## 🧪 Testing

To test the project, use the following command:

```bash
make test
```

This will run all the tests to ensure the functionality works as expected.

## 🔍 Project Details

The project includes the following key components:

1. **BasicNft.sol**:
   This contract allows users to mint ERC721 tokens (NFTs) with unique metadata URIs.

2. **DeployBasicNft.s.sol**:
   A script for deploying the `BasicNft` contract to a blockchain.

3. **TestBasicNft.t.sol**:
   Contains unit tests for the contract's functionality, such as checking the contract name, minting NFTs, and verifying ownership.

4. **Interactions.s.sol**:
   A script to mint an NFT on the deployed contract and interact with it.

## 📜 License

This project is licensed under the MIT License.

Thanks to Cyfrin-Updraft.
