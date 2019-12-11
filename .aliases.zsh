
# Git:

alias gst='git status';
alias gd='git diff -w';
alias gl='git log --graph --oneline --all';
alias gcam='git commit -am';
alias gcanvm='git commit --no-verify -am';


# MySQL:

alias mysql='mysql -u root';
alias mysqldump='mysqldump -u root --add-drop-table';


# Composer:

alias cda='composer dump-autoload';


# Magallanes:

alias mage='~/.composer/vendor/bin/mage';


# PHP: 

alias php73="phpv php@7.3";
alias php74="phpv php";

alias phpunit='vendor/bin/phpunit';
alias puf='vendor/bin/phpunit --order-by=defects --stop-on-defect';   # Previously failed tests, first

phpv() {
    valet stop;
    brew services stop php;
    brew services stop php@7.3;
    brew unlink php php@7.3;
    brew link --force --overwrite $1;
    brew services start $1;
    composer global update;
    rm -f ~/.config/valet/valet.sock
    valet install;
}

xdebug-toggle() { xdebug "$1" --no-server-restart; valet restart; }
