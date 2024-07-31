# ORE-CLI Nix dev environment

Here I have a Nix shell (at the moment) and a bash scripts that allow you to mine ORE at your own pace. I aim to have a containerized environment that can be easily deployable. 

> Ore is a solana crypto that aims for dynamic rewards depending on your HASH/s of your CPU. No matter if you have a Nokia phone or a Threadripper, you will be able to mine. See the [ORE github repo](https://github.com/regolith-labs/ore-cli) for more info

Future features
- [ ] Docker Container
- [ ] Automatic Setup

### Instructions

1. Generate Solana wallet.
2. Store wallet somewhere safe and backup the private key on a very SAFE space.
2.a. Ideally use a different wallet to mine that to make regular trasactions.

3. Set the threads that you would want to use. The mining difficulty would adjust to your CPU power. Based on the difficulty you are going to mine a larger or smaller amount.
4. Start minining
