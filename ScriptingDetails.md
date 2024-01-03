# Scripting

-   All scripting files should be saved with fileName.s.sol
-   for eg DeploySimpleStorage.s.sol

```solidity
import {Script} from "forge-std/Script.sol";
```

-   Just like we may import Forge Std to get testing utilities when writing tests, Forge Std also provides some scripting utilities that we import here.

```solidity
contract DeploySimpleStorage is Script
```

-   DeploySimpleStorage inherits from Script

```solidity
function run() external {}
```

-   By default, scripts are executed by calling the function named run, our entrypoint.

```solidity
vm.startBroadcast(deployerPrivateKey);
```

This is a special cheatcode that records calls and contract creations made by our main script contract.
We pass the deployerPrivateKey in order to instruct it to use that key for signing the transactions.
Later, we will broadcast these transactions to deploy our contract.

```solidity
vm.stopBroadcast();
```

-   Everything inside the start and stop broadcast will be sent as transactions to RPC url

```sh
$ forge script script/DeploySimpleStorage.s.sol --rpc-url {rpc_url} --private-key {private-key} --broadcast
```

-   It will generate a directory called broadcast which will have all information about the deployed contracts

## Broadcast

Broadcast will contain the deployed contracts and dry-run directory

-   If the blockchain node is not up and running contracts deployed will be saved to dry-run
-   Otherwise it will be published on to the blockchain

If we look into the run-latest.json

```json
"transactions": [
    {
      "hash": "0x1530d4a76344147f845211317d58ddeda1024133a79dd3b6e9d2e560d22c4054",
      "transactionType": "CREATE",
      "contractName": "SimpleStorage",
      "contractAddress": "0x5FbDB2315678afecb367f032d93F642f64180aa3",
      "function": null,
      "arguments": null,
      "transaction": {
        "type": "0x02",
        "from": "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",
        "gas": "0x73342",
        "value": "0x0",
        "data": ""
      }
    }
]
```

```json
    "transaction": {
        "type": "0x02",
        "from": "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",
        "gas": "0x73342",
        "value": "0x0",
        "data": ""
    }
```

-   This transaction section is the one sent on to the blockchain using --rpc-url
-   data will contain all the contract deployment code and byte code

```json
    "transaction": {
        "gas": "0x73342",
    }
```

-   We have the "hex" value of "gas"
-   To convert "hex" to "decimal"

```sh
$ cast --to-base 0x73342 dec
```

-   o/p = 471874

-   Other things missing in the transaction are
-   v,r,s

In Ethereum transactions, "v", "r", and "s" are components of the signature. They are part of the digital signature that verifies the authenticity of the transaction. Here's what each component represents:

-   v: This is the recovery id, which is used to recover the public key from the signature. It's a single byte value.
-   r: This is the first half of the signature. It's a 32-byte value.
-   s: This is the second half of the signature. Like r, it's also a 32-byte value.
    These three values together form the signature of the transaction.
    They are generated when a private key signs a transaction.
    Anyone who has the corresponding public key can verify the signature using the transaction data and the signature itself.
