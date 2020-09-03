echo 'You might need to change your default shell to zsh: `chsh -s /bin/zsh` (or `sudo vim /etc/passwd`)'

cd $HOME
mkdir .ben
touch .ben/.privaterc

dir="$HOME/Developer/benwestrate"
mkdir -p $dir
cd $dir
git clone --recursive https://github.com/benwestrate/dotfiles.git
cd dotfiles
sudo bash symlink-dotfiles.sh

