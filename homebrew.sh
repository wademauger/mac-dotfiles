# Install a few essential brew packages
brew install cask thefuck libgcrypt neovim watch tree tmux dtrx openssl python3 wget

# Install xCode CLI Tools
xcode-select --install

# Install RVM (Ruby Version Manager)
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
