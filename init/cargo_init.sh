http -d https://static.rust-lang.org/rustup.sh | sh
touch /home/vastness/.cargo/config
echo "[source.crates-io]
replace-with = 'tuna'

[source.tuna]
registry = \"https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git\"" >> /home/vastness/.cargo/config
source "$HOME/.cargo/env"
cargo install zellij
cargo install --locked bat
cargo install ripgrep
cargo install starship --locked
