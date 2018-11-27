# Basilisk

### A fast aftermarket server for [Cockatrice](https://github.com/Cockatrice/Cockatrice)

# Implementation Status

- [ ] Servatrice Feature Parity
  - [ ] Client Connections
  - [ ] Server Info
  - [ ] Accounts
  - [ ] Password Reset
  - [ ] Email Validation
  - [ ] Roles
  - [ ] Rooms
  - [ ] Games
  - [ ] Chat
  - [ ] Client Listings
  - [ ] Buddies/Ignores
  - [ ] Deck Storage
  - [ ] Replays
  - [ ] Admin Tools
  - [ ] Moderations Tools
  - [ ] Server Logs
  - [ ] Audit Stats
- [ ] Planned Server Features
  - [ ] Fancy Custom Stats
    - [ ] Deck Info
    - [ ] Game Frequency
    - [ ] Other Stuff
  - [ ] Web Accessible Deck Storage
  - [ ] Multi-Server
  - [ ] Suspend To Database
  - [ ] Deck Validation
  - [ ] Rules Plugins

# Building

(This assumes you have already have elixir/mix/hex set up)

### Getting the repo ready

```sh
# clone and enter the repo
git clone https://github.com/skwerlman/basilisk && cd basilisk
# fetch and compile the dependencies
mix deps.get && mix deps.compile
```

### Building Protobufs

Make sure:
- `protoc` is installed and available in your path
- your escripts directory is in your path (`~/.mix/escripts` on linux)

```sh
# install the elixir protobuf compiler
mix escript.install protobuf
# compile the protobufs
protoc -I proto_buf --elixir_out=./lib/proto_buf/ proto_buf/*.proto
```

### Building basilisk

```sh
mix compile
```

### Testing

```sh
# Run the tests
mix test
# Run credo
mix credo
# Run dialyxir
mix dialyzer
```

### Building a release

TODO
