#!/bin/bash
set -e

if [ "$1" = 'bitcoin-cli' -o "$1" = 'bitcoin-tx' -o "$1" = 'bitcoind' -o "$1" = 'test_bitcoin' ]; then
	mkdir -p "$BITCOIN_DATA"

	if [ ! -s "$BITCOIN_DATA/bitcoin.conf" ]; then
		cat <<-EOF > "$BITCOIN_DATA/bitcoin.conf"
		testnet=1
		server=1
		rpcport=8332
		rpctimeout=30
		walletnotify=cron/receive.sh %s
		printtoconsole=1
		rpcpassword=Wl0xpasS
		rpcuser=wloxuser
		EOF
	fi

	chown -R bitcoin "$BITCOIN_DATA"
	exec gosu bitcoin "$@"
fi

exec "$@"
