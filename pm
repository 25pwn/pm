#!/bin/sh
set -e
pm_undefined()
{
	printf "%s\n" "action unspecified"
	exit 1
}

entry()
{
	pm_action="${1:?}"
	pm_package="${2:?}"

	. ./._common

	# TODO: parse

	. "./${pm_package}"
	
	if [ "${pm_package_name}" = "" ]; then
		printf "%s\n" "package name undefined"
		exit 1
	fi

	pm_package_data_dir="${pm_data_dir}/${pm_package_name}"
	pm_package_state_dir="${pm_state_dir}/${pm_package_name}"
	
	"pm_${pm_action:-unspecified}"

}

entry "$@"