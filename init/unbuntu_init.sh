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
	# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
	echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse' >/etc/apt/sources.list
	echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse' >>/etc/apt/sources.list
	echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse' >>/etc/apt/sources.list
	echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse' >>/etc/apt/sources.list
	# 预发布软件源，不建议启用
	# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
	# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
	# neovim-ppa
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt update
fi
echo '=======================install softwares======================='
softwares=(software-properties-common translate-shell fd-find figlet lolcat ruby-full gcc make git-all neovim fzf zsh htop)
for software in "${softwares[@]}"; do
	software_cli=$(whereis "$software")
	if [ "${software_cli}" != "$software:" ]; then
		echo "$software is already installed"
	else
		echo "=============== install $software ==============="
		apt install "$software" -y
	fi
done

# ctop
apt install zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat1-dev liblzma-dev libffi-dev libc6-dev
sudo http -d -o /usr/local/bin/ctop https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64
sudo chmod +x /usr/local/bin/ctop

gem install colorls

echo '=======================config git======================='
git config --global user.name vastness
git config --global user.email 1916286435@qq.com
echo '=======================config zsh======================='
git clone https://gitcode.net/mirrors/robbyrussell/oh-my-zsh.git /home/vastness/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions /home/vastness/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/vastness/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
chsh -s /usr/bin/zsh

cat <<EOF
 ██████╗ ██╗  ██╗███╗   ███╗██╗   ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
██╔═══██╗██║  ██║████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
██║   ██║███████║██╔████╔██║ ╚████╔╝ ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║   ██║██╔══██║██║╚██╔╝██║  ╚██╔╝  ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
╚██████╔╝██║  ██║██║ ╚═╝ ██║   ██║   ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝                                                                                   
EOF
