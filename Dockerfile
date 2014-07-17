FROM ubuntu:12.04
MAINTAINER Jud Stephenson <j@nybex.com>

RUN apt-get update -qq
RUN apt-get install python-software-properties -qq -y
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update -qq
RUN apt-get install bitcoind -y -qq

RUN adduser --disabled-login --gecos "" bitcoin

WORKDIR /home/bitcoin

# Add our config
RUN mkdir -p /.bitcoin
ADD bitcoin.conf /.bitcoin/bitcoin.conf

# Chown it
RUN chown -R bitcoin:bitcoin /.bitcoin/

# Keep the data directory around
VOLUME ["/.bitcoin"]

# Use our bitcoin user
USER bitcoin

# Expose the testnet and mainnet ports
EXPOSE 18332 18333 8332 8333

ENTRYPOINT ["bitcoind"]
CMD ["-?"]
