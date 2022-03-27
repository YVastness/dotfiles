#!/usr/bin/env bash
# author:vastness

cat <<EOF
 ██████╗ ██╗  ██╗███╗   ███╗██╗   ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
██╔═══██╗██║  ██║████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
██║   ██║███████║██╔████╔██║ ╚████╔╝ ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║   ██║██╔══██║██║╚██╔╝██║  ╚██╔╝  ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
╚██████╔╝██║  ██║██║ ╚═╝ ██║   ██║   ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝                                                                                   
EOF

echo '===============change sources===================='
read -p "是否要换Ubuntu软件源（y/N)" sources
if [ $sources == 'y' ]; then
	chmod 777 /etc/apt/sources.list
	echo 'deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free' >/etc/apt/sources.list
	echo 'deb-src https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free' >>/etc/apt/sources.list
	apt update
fi
echo '=======================install softwares======================='
add-apt-repository ppa:deadsnakes/ppa
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update
softwares=(software-properties-common python3.9 golang fd-find ruby-full bat make yadm lazygit neovim ranger fzf autojump git zsh ripgrep htop)
for software in "${softwares[@]}"; do
	software_cli=$(whereis "$software")
	if [ "${software_cli}" != "$software:" ]; then
		echo "$software is already installed"
	else
		echo "=============== install $software ==============="
		apt install "$software" -y
	fi
done

curl -sS https://starship.rs/install.sh | sh
go get github.com/jesseduffield/lazydocker

echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
apt update
apt install docker-ctop

gem install colorls

# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo '=======================config git======================='
git config --global user.name vastness
git config --global user.email 1916286435@qq.com
git clone https://gitee.com/yin_haoyu/nvim.git /home/vastness/.config/nvim
git clone https://gitee.com/yin_haoyu/config.git /home/vastness/.config
git clone git://github.com/sjl/oh-my-zsh.git ~/.oh-my-zsh
yadm clone  https://gitee.com/yin_haoyu/yadm.git
echo '=======================config zsh======================='
chsh -s /usr/bin/zsh

cat <<EOF
 ██████╗ ██╗  ██╗███╗   ███╗██╗   ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
██╔═══██╗██║  ██║████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
██║   ██║███████║██╔████╔██║ ╚████╔╝ ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║   ██║██╔══██║██║╚██╔╝██║  ╚██╔╝  ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
╚██████╔╝██║  ██║██║ ╚═╝ ██║   ██║   ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝                                                                                   
EOF
