git clone https://github.com/pyenv/pyenv.git ~/.pyenv
mkdir ~/.pyenv/cache
http -d -o ~/.pyenv/cache/Python-3.9.9.tar.xz https://registry.npmmirror.com/-/binary/python/3.9.9/Python-3.9.9.tar.xz
pyenv install 3.9.9
pyenv global 3.9.9
pip install asciinema
# pip install cheat
pip install ranger-fm
