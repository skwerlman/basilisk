# Basilisk

### A fast aftermarket server for [Cockatrice](https://github.com/Cockatrice/Cockatrice)

# In Development!

See the [design wiki page](https://github.com/skwerlman/basilisk/wiki/Design) if you're interested in helping

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
# install hooks, the elixir protobuf compiler, fetch deps, and compiles the project
mix setup
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
