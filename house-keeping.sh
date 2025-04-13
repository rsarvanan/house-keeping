#!/bin/bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]}")

## Receipies to be converted into TOML/YAML files later.

bootstrap() {
	run_command_for_install brew
}

run_command_for_install() {
	echo "=> ${1}"
	sh $BASE_DIR/commands/${1}.sh --install-if-required
}

case $1 in
	bootstrap)
		echo "Boostrapping a new work machine ..."
		bootstrap		
		;;
	*)
		echo "Invalid command"
		;;
esac
