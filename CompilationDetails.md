# To compile a solidity file

```shell
$ forge build
```

After running this command, 2 directories will be generated

-   out
-   cache

## Out

Out directory will have all the information about the smart contract

-   ABI
-   bytecode
-   methodIdentifiers
-   metadata

This directory contains the compiled output of your smart contracts. Each contract will have its own JSON file in this directory. The JSON file includes important information such as the contract's ABI (Application Binary Interface), bytecode, and other metadata. The ABI is a specification for how to interact with the contract, including its functions and events. The bytecode is the compiled machine code of the contract.

## Cache

This directory is used by the Solidity compiler to cache intermediate results during the compilation process. Caching can significantly speed up subsequent compilations because the compiler can reuse previously computed results instead of having to compute everything from scratch. However, in some cases, you might want to clear the cache to ensure a clean build. You can do this by deleting the contents of the Cache directory.
