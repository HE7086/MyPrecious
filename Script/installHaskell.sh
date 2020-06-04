#!/bin/bash

# install statically linked haskell tools using stack
# newer version may not work well

[[ -z $GHC_VERSION ]] && GHC_VERSION=8.6.5

echo "Installing haskell environment..." 
echo "you will need at least following packages installed:"
echo "git, wget"

which ghc || echo "haskell already installed, skipping"; exit

wget https://get.haskellstack.org/stable/linux-x86_64-static.tar.gz
tar xzf linux-x86_64-static.tar.gz
cp linux-x86_64-static/stack ~/.local/bin/stack
rm -rf stack-linux-x86_64-static

stack setup $GHC_VERSION
stack upgrade --force-download
stack install cabal-install
ln -s `stack exec which ghc` ~/.local/bin/ghc
ln -s `stack exec which ghci` ~/.local/bin/ghci
ln -s `stack exec which ghc-pkg` ~/.local/bin/ghc-pkg
ln -s `stack exec which haddock` ~/.local/bin/haddock
ln -s `stack exec which runhaskell` ~/.local/bin/runhaskell

echo "Installing haskell-ide-engine..."
echo "Install dependencies"
yay -S ncurses5-compat-libs

git clone https://github.com/haskell/haskell-ide-engine.git --recurse-submodules
cd haskell-ide-engine
stack ./install.sh hie-$GHC_VERSION
stack ./install.sh data
