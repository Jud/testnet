## Testnet - Bitcoin testnet node for docker.

Simple and easy way to get a testnet node up and running in less than 15 minutes!

```
# Create a data container
=> docker run --name testnet-data --user bitcoin --volume /.bitcoin --entrypoint="/bin/bash" judson/testnet -l

# Start the server
=> docker run --volumes-from testnet-data judson/testnet -debug
```

Let the node sync and you are ready to go.

### Credentials and things
The testnet node listens on 18882 (RPC) and 18883 (P2P).

```
RPC Credentials:
- user: bitcoin
- pass: 12345
```
