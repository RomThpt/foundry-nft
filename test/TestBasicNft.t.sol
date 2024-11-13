// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract TestBasicNft is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    address public ANOTHER_USER = makeAddr("anotherUser");

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
        vm.deal(USER, 1 ether); // Give USER enough ether for minting
        vm.deal(ANOTHER_USER, 1 ether); // Give ANOTHER_USER enough ether for minting
    }

    function testNameIsCorrect() public {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();
        assertEq(actualName, expectedName, "The name of the NFT should be 'Doggie'");
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNft("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");
        assertEq(basicNft.balanceOf(USER), 1, "USER should have 1 NFT after minting");

        string memory expectedTokenUri =
            "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
        string memory actualTokenUri = basicNft.tokenURI(0);
        assertEq(actualTokenUri, expectedTokenUri, "The token URI for the minted NFT should match the expected URI");
    }


    function testBalanceBeforeAndAfterMint() public {
        assertEq(basicNft.balanceOf(USER), 0, "USER should have 0 NFTs before minting");

        vm.prank(USER);
        basicNft.mintNft("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");

        assertEq(basicNft.balanceOf(USER), 1, "USER should have 1 NFT after minting");
    }

    function testMintByAnotherUser() public {
        vm.prank(ANOTHER_USER);
        basicNft.mintNft("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");

        assertEq(basicNft.balanceOf(ANOTHER_USER), 1, "ANOTHER_USER should have 1 NFT after minting");
    }

    function testLongTokenUri() public {
        string memory longUri =
            "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json&extra=long-uri-with-many-parameters";
        vm.prank(USER);
        basicNft.mintNft(longUri);

        string memory actualTokenUri = basicNft.tokenURI(0);
        assertEq(actualTokenUri, longUri, "The token URI should handle long URIs correctly");
    }

    function testEmptyTokenUri() public {
        string memory emptyUri = "";
        vm.prank(USER);
        basicNft.mintNft(emptyUri);

        string memory actualTokenUri = basicNft.tokenURI(0);
        assertEq(actualTokenUri, emptyUri, "The token URI should handle empty URIs correctly");
    }
}
