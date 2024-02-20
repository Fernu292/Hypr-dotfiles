#
# Instalador para configurar los dotfiles de 
# BSPWM y gestionar todas las aplicaciones necesarias
#
#

function presentation ()
{
	echo "=== === === === === === === === === ==="
	echo "=== 	DotFiles FernuDev 0.01      ==="
	echo "=== === === === === === === === === ==="
}



presentation

# Updating system

echo $(sudo pacman -Syu)


