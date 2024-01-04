# Deployment Details

Note: Don't do the below steps in vs code terminal use mac terminal while encrypting

```sh
cast wallet import your-account-name --interactive
Enter private key:
Enter password:
`your-account-name` keystore was saved successfully. Address: address-corresponding-to-private-key
```

Once we Encrypted our Private Key, we can deploy safley

```sh
forge script <script> --rpc-url <rpc_url> --account <account_name> --sender <address> --broadcast
```
