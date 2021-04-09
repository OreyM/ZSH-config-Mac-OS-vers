###########################################################
###########   ZSH CONFIG SCRIPT BY Uncle Orey   ###########
###########        oreymgt@gmail.com            ###########
###########################################################

# Default directory
cd ~/_project/

ZSH_DISABLE_COMPFIX='true'

# export ZSH='/Users/orey/.oh-my-zsh'
# source $ZSH/oh-my-zsh.sh
export ZSH="/Users/orey/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
    brew                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew
    colored-man-pages   # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
    colorize            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize
    composer            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/composer
    docker              # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
    docker-compose      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose
    git                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
    laravel             # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/laravel
    node                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/node
    npm                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm
    sudo                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
    symfony             # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/symfony
    symfony2            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/symfony2
    vagrant             # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vagrant
    web-search          # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
    zsh-interactive-cd  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd
                        # This plugin requires fzf => `brew install fzf`
)


# ZSH_THEME="robbyrussell"
ZSH_THEME='powerlevel9k/powerlevel9k'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='↳ '
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{cyan} \uF179 %F{white}'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{cyan} \u2192 %F{white}'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''

source $ZSH/oh-my-zsh.sh

# Default aliases
alias s='sudo ' # or double ESC for insert 'sudo' before the last command
alias c='clear'
alias e='exit'
alias m='make '
alias screen='screenfetch' # need `brew install screenfetch`
alias h='history'
alias ip='curl ifconfig.co' # My Ip
alias port:80='netstat -nat|grep -i ":80"|wc -l' # view all 80 Port Connections
alias port:who='lsof -nP -i4TCP:8000 | grep LISTEN' # check port :8000
alias -g G='|grep' # 
# alias l='ls'
# alias ll='ls -l'
# alias la='ls -a'
alias lal='ls -la'
alias li='ls -ial' # show with inodes
alias lsd='ls -ld *(-/DN)' # show catalog only
alias mem='ps -e -orss=,args= | sort -b -k1 -nr | head -10' # display the top 10 processes using the most memory
alias cpu='ps -e -o pcpu,cpu,nice,state,cputime,args |sort -k1 -nr | head -10' # display the top 10 processes using the most CPU

# FUNCTIONS
# list contents of directories in a tree-like format
if ! (( $+commands[tree] )); then
    tree () {
        find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
    }
fi
# Clear zombie processes
clrz() {
    ps -eal | awk '{ if ($2 == "Z") {print $4}}' | kill -9
}

# ZSH
alias ohmyzsh='cd ~/.oh-my-zsh'
alias z:c='code ~/.zshrc' # edit zsh conf
alias z:s='source ~/.zshrc' # update zsh
alias z:h='ccat ~/.zshrc' # look zsh conf

# Brew
alias='brew services list' # show all brew services

#DIR Alias
alias dir:p='cd ~/_project/'
alias dir:d='cd ~/_docker/'

#Editor alias
alias edit='mcedit ' # Midnight Commander Edit
alias storm='/Applications/PhpStorm.app/Contents/MacOS/phpstorm' # PhpStorm IDE

#PHP
alias phpini='cd /usr/local/etc/php/' # + vers PHP, ex 7.3
alias phpserve='php -S localhost:8000' # simple php serve
alias phpserve:pub='php -S localhost:8000 public/index.php' # simple php serve

# NGINX
alias nginx:status='sudo nginx -s status'
alias nginx:start='sudo nginx -s start'
alias nginx:stop='sudo nginx -s stop'
alias nginx:restart='sudo nginx -s restart'
alias nginx:ip="ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'"

# MySQL
alias mysql:status='sudo /usr/local/mysql/support-files/mysql.server status'
alias mysql:start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql:stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysql:restart='sudo /usr/local/mysql/support-files/mysql.server restart'
alias mysql:local='mysql -u root -proot'

# SSH
alias ssh:enter='ssh USER@IP' # sergiy@10.0.0.1
alias ssh:port='ssh USER@IP -p PORT' # ssh sergiy@192.168.1.2 -p 2223
alias ssh:key-gen='ssh-keygen -t rsa -b 4096'
alias ssh:key='cat ~/.ssh/id_rsa.pub'

#GIT Alias
alias git:editor='git config --global core.editor mcedit'
alias clone='git clone'
alias status='git status'
alias add='git add .'
alias commit='git commit -m'
alias push='git push origin master'
alias push:m='git push -u origin main'
alias pull='git pull'
alias nah='git reset --hard;git clean -df' 
# glog

#Composer
# ci    | composer install
# cdo   | composer dump-autoload -o
# cu    | composer update

#Docker Alias
alias dc:up='docker-compose up nginx mysql phpmyadmin redis beanstalkd'
alias dc:stop='docker-compose stop'
alias dc:work='docker-compose exec workspace zsh'
alias dc:mysql='docker-compose exec mysql bash'
alias dc:cli='docker-compose run --rm api-php-cli '

# Laradock
## https://github.com/Laradock/laradock.git
# DB_HOST=mysql
# REDIS_HOST=redis
# QUEUE_HOST=beanstalkd
alias ldserve='docker-compose up -d nginx mysql phpmyadmin redis workspace'
alias ldbash='docker-compose exec --user=laradock workspace bash'
alias ldstop='docker-compose stop'
alias ldwork='docker-compose exec --user=laradock workspace bash'


#Laravel Alias
alias laravel='~/.composer/vendor/bin/laravel'
alias larperm='sudo chgrp -R www-data storage bootstrap/cache; sudo chmod -R ug+rwx storage bootstrap/cache'
alias lara='php artisan'
alias serve='php artisan serve'
alias controller='php artisan make:controller'
alias model='php artisan make:model'
alias observer='php artisan make:observer' # NameObserver --model=Model/ModelName
alias db:reset='php artisan migrate:reset && php artisan migrate --seed'
alias migration='php artisan make:migration'
alias migrate='php artisan migrate'
alias seeder='php artisan make:seed'
alias seed='php artisan db:seed --class='
alias fresh="php artisan migrate:fresh"
alias refresh='php artisan migrate:refresh --seed'
alias route:l='php artisan route:list'
alias route:g='php artisan  route:list | grep -i'
alias storage:l='php artisan storage:link'
alias dusk='php artisan dusk'
# Генерация PHPDoc для моделей (Laravel IDE Helper)
alias modelhelp='php artisan ide-helper:models --dir="app/Entity"'

# NPM
alias npm:i='npm install '
alias npm:s='npms search '
alias npm:w='npm run watch'
alias npm:d='npm run dev'
alias npm:p='npm run prod'
# # Opens https://nodejs.org/docs/latest-v10.x/api/fs.html
# $ node-docs fs
# # Opens https://nodejs.org/docs/latest-v10.x/api/path.html
# $ node-docs path
# EXPO
alias expo:s='npm start' # you can open iOS, Android, or web from here, or run them directly with the commands below.
alias expo:a='npm run android'
alias expo:i='npm run ios'
alias expo:w='npm run web'

# Yarn
alias yarn:i='yarn install '
alias yarn:b='yarn build'
alias yarn:s='yarn serve'
alias yarn:d='yarn dev'
alias yarn:r='yarn run'
alias yarn:c='yarn cache clean'

#PHPUnit Alias
alias testy='vendor/bin/phpunit --colors=always'
alias testy:f="phpunit --filter"
alias testy:d='phpunit --debug'

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

export PATH=${PATH}:/usr/local/mysql/bin/
export PATH=$PATH:/Users/orey/Library/Python/2.7/bin
