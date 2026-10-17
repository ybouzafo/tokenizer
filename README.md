# ShilalToken42 (ShT42)

A simple **ERC-20 fungible token** developed for the **42 Tokenizer** project in partnership with **BNB Chain**.

---

## Project Overview

**ShilalToken42** (ticker: **ShT42**) is an educational blockchain project deployed on the **Ethereum Sepolia testnet**.

The goal of this project is to demonstrate the complete lifecycle of a standard ERC-20 token, including:

* Deployment
* Minting new tokens
* Transferring tokens
* Tracking balances
* Burning tokens

This project was created for learning purposes only and does not involve real money.

---

## Key Features

* Built using OpenZeppelin's audited ERC-20 implementation
* Owner-controlled minting
* Token transfers between users
* Token burning supported
* Deployed and tested on Sepolia testnet

---

## Technical Choices

| Category         | Choice                         |
| ---------------- | ------------------------------ |
| Blockchain       | Ethereum Sepolia               |
| Token Standard   | ERC-20                         |
| Language         | Solidity ^0.8.20               |
| Libraries        | OpenZeppelin (ERC20 + Ownable) |
| Development Tool | Remix IDE                      |
| Wallet           | MetaMask                       |

---

## Repository Structure

```txt
README.md
│
├── code/
│   └── ShilalToken42.sol
│
├── deployment/
│   └── how_to_deploy.md
│
└── documentation/
    └── whitepaper.md
```

---

## Learning Objectives

This project demonstrates:

* ERC-20 token creation
* Smart contract deployment
* Blockchain transaction execution
* Token management (mint, transfer, burn)
* Testnet development workflow

---

## Contract Information

| Field            | Value                             |
| ---------------- | --------------------------------- |
| Name             | ShilalToken42                     |
| Symbol           | ShT42                             |
| Network          | Ethereum Sepolia                  |
| Contract Address | See `deployment/how_to_deploy.md` |

---

## Quick Demo Guide

For complete deployment instructions and demonstrations:

See `deployment/how_to_deploy.md`

This guide explains:

* Wallet setup
* Sepolia configuration
* Deployment process
* Contract interaction
* Token usage

---

## Documentation

Detailed technical documentation is available in:

`documentation/whitepaper.md`

---

## Notes

* This project uses **Sepolia testnet only**
* No real ETH or real financial value is involved
* Keep the deployer wallet secure
* Avoid using `renounceOwnership()` unless intentionally removing owner permissions

---

Developed as part of the **42 Tokenizer Project**.
