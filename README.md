# Semaphore-Hardhat-Foundry template

This is a sample Semaphore project that can be used as a template. It uses Foundry in a Hardhat project.

## Clone the repository

```bash
git clone https://github.com/vplasencia/semaphore-hardhat-foundry.git
```

## Install dependencies

```bash
yarn install:all
```

## Compile contracts

```bash
yarn compile
```

## Test contracts

```bash
yarn test:all
```

## Show gas report

```bash
make gas-report
```

## Snapshot

```bash
make snapshot
```

You can also generate a test coverage report:

```bash
yarn test:coverage
```

Or a test gas report:

```bash
yarn test:report-gas
```

### Deploy

1. Copy the `.env.example` file as `.env`.

```bash
cp .env.example .env
```

2. Add your environment variables.

> **Note**  
> You should at least set a valid Ethereum URL (e.g. Infura) and a private key with some ethers.

3. And deploy your contract.

```bash
yarn deploy --semaphore <semaphore-address> --group <group-id> --network goerli
```

> **Note**  
> Check the Semaphore contract addresses [here](https://semaphore.appliedzkp.org/docs/deployed-contracts#semaphore).

> **Warning**  
> The group id is a number!
