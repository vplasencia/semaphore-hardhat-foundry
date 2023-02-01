-include .env

.PHONY: all test clean

all: clean remove install build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install foundry-rs/forge-std semaphore-protocol/semaphore privacy-scaling-explorations/zk-kit OpenZeppelin/openzeppelin-contracts

install-no-git :; forge install --no-git foundry-rs/forge-std semaphore-protocol/semaphore privacy-scaling-explorations/zk-kit OpenZeppelin/openzeppelin-contracts

# Update Dependencies
update :; forge update

build :; forge build

test :; forge test

gas-report :; forge test --gas-report

snapshot :; forge snapshot

slither :; slither ./src 

format :; prettier --write src/**/*.sol && prettier --write src/*.sol

# solhint should be installed globally
lint :; solhint src/**/*.sol && solhint src/*.sol

# use the "@" to hide the command from your shell
deploy-goerli :; @forge script script/Greeter.s.sol:GreeterScript --rpc-url ${ETHEREUM_URL} --broadcast -vvvv

deploy-goerli-verify :; @forge script script/Greeter.s.sol:GreeterScript --rpc-url ${ETHEREUM_URL} --broadcast --verify -vvvv