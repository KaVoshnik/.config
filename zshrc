### KaVoshnik CONFIG ###

alias pj="cd ~/projects"
alias nw="ping -c 3 google.com"
alias server="cd ~/projects/Chess2-Web/js && node server.js"
alias cw="sudo docker start postgresql -i"
alias rc='source ~/.zshrc'
alias Syu='sudo pacman -Syu'  
alias install='sudo pacman -S'
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="archcraft"
plugins=(git)

source $ZSH/oh-my-zsh.sh

f() {
echo "Clang format:"
clang-format --style='{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 110}' -i *.c
echo "CPP check:"
cppcheck --enable=all --suppress=missingIncludeSystem *.c
}

c() {
    if [ -z "$1" ]; then
        echo "Error: Specify file to compile."
        return 1
    fi
    gcc -Wall -Werror -Wextra -o main.out "$1" && ./main.out && rm main.out
}

killp() { 
    pkill -f "$1" && echo "Process '$1' kill" || echo "Error: Process not founfd"
}

killall() {  
    pgrep -f "$1" | xargs kill -9 && echo "Killed: $(pgrep -f "$1" | wc -l) Process" 
}  

fcs() {
    echo "Clang format:"
    clang-format --style='{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 110}' -i *.cs
}

cs() {
    if [ -z "$1" ]; then
        echo "Error: Specify file to compile."
        return 1
    fi
    mcs "$1" -out:File.exe && mono File.exe && rm File.exe
}
