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
