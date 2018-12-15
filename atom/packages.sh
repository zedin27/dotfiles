#!/bin/sh

# Hacking Atom WIP

# By the way, when you are getting your packages that you want to install and
# you have the @ and bunch of numbers, attempt using ReGex make your life easier

list= ("busy-signal" \
"file-icons" \
"header-42" \
"intentions" \
"language-x86-64-assembly" \
"linter" \
"linter-pydocstyle" \
"linter-ui-default" \
"platformio-ide-terminal")

for pkgs in ${list[@]}
do
	apm install $pkgs
done
