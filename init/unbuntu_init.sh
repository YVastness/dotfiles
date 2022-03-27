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
softwares=(fd yadm neovim ranger fzf autojump git zsh)
for software in "${softwares[@]}"; do
	software_cli=$(whereis "$software")
	if [ "${software_cli}" != "$software:" ]; then
		echo "$software is already installed"
	else
		echo "=============== install $software ==============="
		apt install "$software" -y
	fi
done
echo '=======================config git======================='
git config --global user.name vastness
git config --global user.email 1916286435@qq.com
git clone https://gitee.com/yin_haoyu/nvim.git /home/vastness/.config/nvim
git clone https://gitee.com/yin_haoyu/config.git /home/vastness/.config
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
