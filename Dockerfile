# Use the official Rust image as the base image
FROM rust:latest

# Update the package list and install any additional dependencies if needed
RUN apt-get update

# Install the ore-cli crate
RUN cargo install ore-cli

# Add the directory containing the ore executable to the PATH
ENV PATH=/root/.cargo/bin:$PATH

# Set the working directory
WORKDIR /usr/src

# Download the Solana release tar.bz2 file
ADD https://github.com/solana-labs/solana/releases/download/v1.18.21/solana-release-x86_64-unknown-linux-gnu.tar.bz2 solana.tar.bz2

# Extract the Solana release tar.bz2 file
RUN tar jxf solana.tar.bz2

# Change the working directory to the extracted Solana release directory
WORKDIR /usr/src/solana-release

# Update the PATH to include the Solana release bin directory
ENV PATH=/usr/src/solana-release/bin:$PATH

# Set the entrypoint for the container to use the ore command
ENTRYPOINT ["cd"]

# Provide a way to override the entrypoint to run a shell
CMD ["bash"]

RUN cd ~
