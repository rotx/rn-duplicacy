# Duplicacy .deb App Package for ReadyNAS

This project downloads duplicacy from github, and packages it so that it can be installed on
the ReadyNAS. The following assumes an ARM based NAS, but it should be possible to adjust the
build process to build an x86_64 package as well.

## Raspberry Pi build environment

Rather than running inside a VM, the following instructions assume a Raspberry Pi (running Raspbian
Stretch). Modify the build scripts (to include the schroot calls) to use a VM instead.
The official ReadyNAS build environment is at https://github.com/ReadyNAS/sdk.

To prepare the Raspi:

    sudo apt-get install dh-make devscripts libxml2-utils
    cd /usr/bin
    sudo ln -s arm-linux-gnueabihf-strip arm-linux-gnueabi-strip

## Building the .deb package

To download and package a new release version of duplicacy, edit the `VERSION` file.
Then, run:

    ./clean.sh
    ./prepare.sh
    ./build.sh

This should result in a package named `duplicacy_#.#.#_armel.deb` where #.#.# is the version
number.

## Preparing the NAS

Create a share named `duplicacy`. The package does not do that automatically. Use a Mac (or Linux)
hosted duplicacy CLI to create the configured `.duplicacy` folder on the share.

## Installing the App

Upload the `duplicacy_#.#.#_armel.deb` file to the NAS. The `fvapp-duplicacy.timer` will run the
`run-duplicacy.sh` script every night (to adjust the frequency, edit the `.timer` file either
before building or using SSH access to the NAS).

## Final Note

Duplicacy itself is not free software. Please see https://github.com/gilbertchen/duplicacy.