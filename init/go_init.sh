http -d https://studygolang.com/dl/golang/go1.19.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz
sudo rm -rf  ./go1.19.5.linux-amd64.tar.gz
go install github.com/jesseduffield/lazygit@latest
go install github.com/charmbracelet/glow@latest
go install github.com/jesseduffield/lazydocker@latest
