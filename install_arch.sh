#
#
# Instalador para configurar los dotfiles de 
# Ubuntu 24.04 y configuracion de terminal aplicaciones
# y demas programas
#

function presentation
{
	echo -e "\n\t=== === === === === === === === === === ==="
	echo -e "\t=== DotFiles FernuDev 0.01 Arch Linux =="
	echo -e "\t=== === === === === === === === === === ===\n\n"
}

function copyFiles
{
    # Check if nvim directory exist
    if [ -d "$HOME/.config/nvim" ]; then
        # Check if init.vim exist
        echo -e "\n\tExiste el directorio nvim"
        if [ -f "$HOME/.config/nvim/init.vim" ]; then
            echo -e "\tExiste el archivo init.vim"
            cp $HOME/.config/nvim/init.vim $HOME/.config/nvim/backup.vim
            cp config/nvim/init.vim $HOME/.config/nvim/init.vim
        else
            echo -e "\n\tNo existe el archivo creando copiando ...\n"
            cp config/nvim/init.vim $HOME/.config/nvim/
        fi
    else
        echo -e "\n\tEl directorio no existe copiando ...\n"
	mkdir $HOME/.config/nvim
        cp config/nvim/init.vim $HOME/.config/
    fi

    # Check if kitty directory exist
    if [ -d "$HOME/.config/kitty" ]; then
        echo -e "\n\tExiste el directorio kitty"
        if [ -f "$HOME/.config/kitty/kitty.conf" ]; then
            echo -e "\tExiste el archivo kitty.conf"
            cp $HOME/.config/kitty/kitty.conf $HOME/.config/kitty/backup_kitty.conf
            cp config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
        else
            echo -e "\n\tNo existe el archivo copiando ...\n"
            cp config/kitty/kitty.conf $HOME/.config/kitty/
        fi
    else
        echo -e "\n\tEl directorio no existe copiando...\n"
        cp config/kitty/ $HOME/.config/
    fi

    # Check if .zshrc exist
    if [ -f "$HOME/.zshrc" ]; then
        echo -e "\n\tExiste el archivo .zshrc"
        cp $HOME/.zshrc $HOME/.zshrc_backup
    else
        echo -e "\n\tNo existe el archivo, copiando ...\n"
        cp home/.zshrc $HOME/
    fi
}

presentation

# Updating system Arch
sudo pacman -Syu 

# Install development tools
sudo pacman -S gcc g++ git curl neovim kitty
sudo pacman -S zsh

chsh -s $(which zsh)

# Install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# History
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Eza intallation
sudo pacman -S eza

# Install vimplug for plugins

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

copyFiles
