FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites and add /usr/games to PATH
RUN apt-get update && \
    apt-get install -y cowsay fortune netcat && \
    rm -rf /var/lib/apt/lists/*

# Copy the script
COPY wisecow.sh /wisecow.sh

# Make it executable
RUN chmod +x /wisecow.sh

# Ensure cowsay and fortune are in PATH
ENV PATH="/usr/games:$PATH"

CMD ["/wisecow.sh"]
