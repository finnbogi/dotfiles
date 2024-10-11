pacman -Syu

pacman -Sy ttf-firacode-nerd \
           xorg-server \
           xorg-xinit \
           xorg-xrandr \
           xorg-xsetroot \
           lightdm \
           lightdm-gtk-greeter

systemctl enable lightdm.service
systemctl start lightdm.service


pacman -Sy i3-wm \
           i3status \
           i3blocks \
           i3lock-color \
           dmenu

pacman -Sy playerctl \
           feh \
           acpi \
           picom \
           redshift \
           thunar \
           ranger \
           fastfetch \
           neovim \
           lazygit

# curl -fsSL https://get.jetify.com/devbox | bash