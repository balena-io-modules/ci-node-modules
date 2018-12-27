#!/bin/bash

rmNodeModules()
{
	if [ -d "node_modules" ]; then
		echo "Deleting node_modules"
		rm -r node_modules
	else
		echo "No node_modules folder to delete"
	fi
}

if [ -f "yarn.lock" ]; then
	echo "yarn.lock found."
	rmNodeModules
	echo "Running yarn install ..."
	yarn install --frozen-lockfile
	exit 0
fi

if [ -f "package-lock.json" ]; then
	echo "package-lock.json found."
	echo "Running npm ci ..."
	npm ci
	exit 0
fi


if [ -f "package.json" ]; then
	echo "package.json found."
	rmNodeModules
	echo "Running npm install ..."
	npm install --no-package-lock
	exit 0
fi

echo "yarn.lock **not** found!"
echo "package-lock.json **not** found!"
echo "package.json **not** found!"
