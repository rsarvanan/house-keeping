#!/bin/bash

check_if_installed() {
	if ! type brew > /dev/null 2> /dev/null ; then
		return 1
	else
		return 0
	fi
}

install() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

current_version() {
	check_if_installed
	if [ $? -eq 1 ] ; then
		echo "Command 'brew' is not installed."
	else
		brew --version | awk '{print $2}'
	fi
}

list_versions() {
	return current_version
}

upgrade() {
	return 0
}

uninstall() {
	return 0
}

tags() {
	echo "install-tool brew"
}

case $1 in
	--install-if-required)
		check_if_installed
		if [ $? -eq 1 ] ; then
			echo "Command 'brew' is not installed. Installing ..."
			install
			echo "Installed $(current_version)"
		else
			echo "Command 'brew' is already installed with version $(current_version)"
		fi
		;;
	--install)
		install
		;;
	--current-version)
		current_version
		;;
	--list-versions)
		list_versions
		;;
	--upgrade)
		upgrade
		;;
	--uninstall)
		uninstall
		;;
	--tags)
		tags
		;;
	*)
		echo "Invalid command"
		;;
esac
