#source ~/.bash_profile

# Launch screenfetch
# screenfetch

# Default directory
cd ~/_project/

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/oreym/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    npm
    vagrant
    composer
    sudo
    web-search
    laravel5
    docker
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zconf="code ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias zsource='source ~/.zshrc'
alias c='clear'
alias e='exit'
alias whoport='lsof -nP -i4TCP:8000 | grep LISTEN'

#DIR Alias
alias vpath="cd ~/Google/WEB_DEV/_localServer/domains"
alias localpath="cd ~/domain/"
alias project="cd ~/_project/"
alias dockpath="cd ~/_docker/"

#PHP
alias phpini="cd /usr/local/etc/php/" # + vers PHP, ex 7.3

#Editor alias
alias edit='/usr/local/Cellar/midnight-commander/4.8.22/bin/mcedit'
alias phpstorm='/Applications/PhpStorm.app/Contents/MacOS/phpstorm'

#GIT Alias
alias clone='git clone'
alias status='git status'
alias add='git add .'
alias commit='git commit -m'
alias push='git push origin master'
alias pull='git pull'
alias nah='git reset --hard;git clean -df'
# glog

#Composer
alias cda='composer dump-autoload'

#Docker Alias
alias dcup='docker-compose up'
alias dcdown='docker-compose stop'

# Laradock
## https://github.com/Laradock/laradock.git
# DB_HOST=mysql
# REDIS_HOST=redis
# QUEUE_HOST=beanstalkd
alias laradock='git clone https://github.com/Laradock/laradock.git'
alias laradockenv='cp env-example .env'
alias ldbash='docker-compose exec --user=laradock workspace bash'
alias ldserve='docker-compose up -d nginx mysql phpmyadmin redis workspace'
alias ldstop='docker-compose stop'
alias ldwork='docker-compose exec --user=laradock workspace bash'


#Laravel Alias
alias laravel="~/.composer/vendor/bin/laravel"
alias larperm='sudo chgrp -R www-data storage bootstrap/cache; sudo chmod -R ug+rwx storage bootstrap/cache'
alias lara='php artisan'
alias serve='php artisan serve'
alias controller='php artisan make:controller'
alias model='php artisan make:model'
alias migration='php artisan make:migration'
alias migrate='php artisan migrate --seed'
alias seed='php artisan make:seed'
alias seeder='php artisan db:seed --class='
alias refresh='php artisan migrate:refresh --seed'
alias routelist='php artisan route:list'
alias storage-enable='php artisan storage:link'
# Генерация PHPDoc для моделей (Laravel IDE Helper)
alias modelhelp='php artisan ide-helper:models --dir="app/src/Models"'

#NPM
alias nins='npm install'
alias ndev='npm run dev'
alias nprod='npm run prod'
alias nwatch='npm run watch'

#PHPUnit Alias
alias testy='vendor/bin/phpunit --colors=always'

#PATH
#export PATH="/usr/local/sbin:$PATH"

# Add Visual Studio Code (code)
#export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

export PATH="/usr/local/opt/php@7.4/bin:$PATH"