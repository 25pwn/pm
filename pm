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
	pm_package_name="${2:?}"

	. ./._common

	# TODO: parse

	. "./${pm_package_name}"
	
	"pm_${pm_action:-unspecified}"
}

entry "$@"