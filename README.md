# ci-node-modules

A simple sh script that does a clean install of your node_modules dependencies
based on the JavaScript package manager that is most likely being used.

This is designed to:
* delete any pre-existing node_modules folder, so that you don't have stale
  dependencies
* do a clean install of your node module dependencies using the appropriate
  package manager & command based on:
  * whether a yarn.lock exists in the folder
  * whether a package-lock.json exists in the folder
  * whether just a package.json exists in the folder

This depends on `/bin/sh` pointing to a sensible shell, and on `npm` and/or
`yarn` being available in your `$PATH`.

## Why this is useful

This removes the need for you to remember or figure out the appropriate
installation method for the dependencies of any project/module. In case you are
switching between several projects who use different lock file types or no lock
files at all, having to figure out and run the appropriate command can be
counter-productive.

Moreover this also does a clean install of the dependencies
every time, eliminating the chance of facing issues when switching between
branches that are using different versions for some dependencies. For example,
you are trying out a branch that bumps the version of module XYZ to the
next major one and then switch back to work on something different using the
old dependencies.

## Get started

Install it:

```
npm install -g ci-node-modules
```

Navigate to the folder of a JS project/module and run it:

```
ci-node-modules
```