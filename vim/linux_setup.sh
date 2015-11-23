cd ~/
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
./install.sh
rm install.sh
git clone https://github.com/xenophy/kotsutsumi.git vimenv
cp vimenv/vim/.vimrc ~/
