curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh install.sh
rm install.sh

rm -Rf ~/vimenv
git clone https://github.com/xenophy/kotsutsumi.git vimenv
cp vimenv/vim/.vimrc ~/
