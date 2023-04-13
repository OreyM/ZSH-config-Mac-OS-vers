###########################################################
###########   ZSH config script BY OreyM        ###########
###########        oreymgt@gmail.com            ###########
###########################################################

# DEFAUL SETTINGS

ZSH_DISABLE_COMPFIX='true'

export ZSH="/Users/[USER]/.oh-my-zsh" # Set [USER]!
source $ZSH/oh-my-zsh.sh

## Default directory
cd ~/_project/

## Plugins
plugins=(               # https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
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
    web-search          # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
    zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
    zsh-interactive-cd  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd
                        # This plugin requires fzf => `brew install fzf`
)


## ZSH theme settings
ZSH_THEME='powerlevel9k/powerlevel9k' # https://github.com/Powerlevel9k/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete' # https://github.com/ryanoasis/nerd-fonts
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{cyan} \u2192 %F{white}'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''



# FUNCTIONS

## List contents of directories in a tree-like format
if ! (( $+commands[tree] )); then
    tree () {
        find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
    }
fi

## Clear zombie processes
clrz() {
    ps -eal | awk '{ if ($2 == "Z") {print $4}}' | kill -9
}



# ALIASES

## Default aliases
alias s='sudo ' # or double ESC for insert 'sudo' before the last command
alias c='clear'
alias e='exit'
alias m='make '
alias h='history'

alias screen='screenfetch' # need `brew install screenfetch`

alias myip='curl ifconfig.co'
alias port:80='netstat -nat|grep -i ":80"|wc -l' # view all 80 Port Connections
alias port:who='lsof -nP -i4TCP:8000 | grep LISTEN' # check port :8000
alias port:who80='lsof -nP -i4TCP:8080 | grep LISTEN' # check port :8000

alias -g G='|grep' 

# alias l='ls'
# alias ll='ls -l'
# alias la='ls -a'
alias lal='ls -la'
alias li='ls -ial' # show with inodes
alias lsd='ls -ld *(-/DN)' # show catalog only

alias mem='ps -e -orss=,args= | sort -b -k1 -nr | head -10' # display the top 10 processes using the most memory
alias cpu='ps -e -o pcpu,cpu,nice,state,cputime,args |sort -k1 -nr | head -10' # display the top 10 processes using the most CPU

## ZSH
alias ohmyzsh='cd ~/.oh-my-zsh'
alias zsh:e='sudo code ~/.zshrc' # edit zsh conf
alias zsh:u='source ~/.zshrc' # update zsh
alias zsh:s='ccat ~/.zshrc' # look zsh conf

## Brew
alias b:list='brew services list' # show all brew services

## Editor alias
alias edit='mcedit ' # Midnight Commander Edit
alias phpstorm='/Applications/PhpStorm.app/Contents/MacOS/phpstorm' # PhpStorm IDE
alias webstorm='/Applications/WebStorm.app/Contents/MacOS/webstorm' # PhpStorm IDE

## PHP
alias php:ini='php --ini' # php.ini local + xdebug.ini
alias php7:conf='code /usr/local/etc/php/7.4/php.ini'
alias php8:conf='code /usr/local/etc/php/8.1/php.ini'

alias php7:select='brew link --overwrite --force php@7.4'
alias php8:select='brew unlink php && brew link php'

alias phpserve='php -S localhost:8082' # simple php serve
alias phpserve:pub='php -S localhost:8000 public/index.php' # simple php serve

## PHPUnit Alias
alias testy='vendor/bin/phpunit --testdox --colors=always'
alias testy:f='testy --filter=functional' # @group functional
alias testy:u='testy --filter=unit' # @group unit
alias testy:cover='testy --coverage-html var/coverage'
alias testy:u:c='testy:u --coverage-html var/coverage'
alias testy:f:c='testy:f --coverage-html var/coverage'
alias testy:d='vendor/bin/phpunit --debug'

## PHP analyzer
### compposer require phpstan/phpstan
alias stan:l='vendor/bin/phpstan analyse -l 5 app' # for laravel
alias stan:s='vendor/bin/phpstan analyse -l 5 src' # for symfony
alias stan:t='vendor/bin/phpstan analyse -l 5 tests' # for tests

## NGINX
alias nginx:status='sudo nginx -s status'
alias nginx:start='sudo nginx -s start'
alias nginx:stop='sudo nginx -s stop'
alias nginx:restart='sudo nginx -s restart'
alias nginx:ip="ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'"

## MySQL
alias mysql:start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql:stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysql:restart='sudo /usr/local/mysql/support-files/mysql.server restart'
alias mysql:status='sudo /usr/local/mysql/support-files/mysql.server status'
alias mysql:local='mysql -u root -p'

## SSH
alias ssh:enter='ssh USER@IP' # sergiy@10.0.0.1
alias ssh:port='ssh USER@IP -p PORT' # ssh sergiy@192.168.1.2 -p 2223
alias ssh:keygen='ssh-keygen -t rsa -b 4096'
alias ssh:key='cat ~/.ssh/id_rsa.pub'

## GIT Alias
alias git:editor='git config --global core.editor mcedit'
alias clone='git clone'
alias status='git status'
alias add='git add .'
alias commit='git commit -m'
alias push:m='git push -u origin main'
alias pull='git pull'
alias rebi='git rebase -i head~'
alias nah='git reset --hard;git clean -df' 
# glog

## Composer
# ci    | composer install
# cdo   | composer dump-autoload -o
# cu    | composer update

## Docker Alias
alias dc:up='docker-compose up -d'
alias dc:down='docker-compose down'
alias dc:stop='docker-compose stop'
alias dc:work='docker-compose exec workspace zsh'
alias dc:mysql='docker-compose exec mysql bash'
alias dc:cli='docker-compose run --rm api-php-cli '

## Laravel Alias
alias laravel='~/.composer/vendor/bin/laravel'
alias lar:perm='sudo chmod -R 777 storage && sudo chmod -R 777 bootstrap/cache'
alias lar:docperm='sudo chgrp -R www-data storage bootstrap/cache; sudo chmod -R ug+rwx storage bootstrap/cache'
# PHPDoc Generation for Models (Laravel IDE Helper)
alias lar:modelhelp='php artisan ide-helper:models --dir="app"'

alias a='php artisan'

alias a:serve='php artisan serve'

alias a:c='php artisan config:cache'
alias a:cv='php artisan config:cache && php artisan view:clear'
alias a:cr='php artisan config:cache && php artisan route:cache'
alias a:crv='php artisan config:cache && php artisan view:clear && php artisan route:cache'

alias a:cont='php artisan make:controller'
alias a:mod='php artisan make:model'
alias a:obs='php artisan make:observer' # NameObserver --model=Model/ModelName
alias a:mig='php artisan make:migration'
alias a:seed='php artisan make:seed'

alias a:migrate='php artisan migrate'
alias a:migrate:all='php artisan migrate:status'
alias a:reset='php artisan migrate:reset && php artisan migrate --seed'
alias a:fr="php artisan migrate:fresh"
alias a:refr='php artisan migrate:refresh --seed'

alias a:seed:cls='php artisan db:seed --class='

alias a:r:l='php artisan route:list'
alias a:r:g='php artisan  route:list | grep -i'

alias a:storage:l='php artisan storage:link'

alias npm:w='npm run watch'
alias npm:h='npm run hot'
alias npm:d='npm run dev'
alias npm:p='npm run prod'

## Laradock
# https://github.com/Laradock/laradock.git
# DB_HOST=mysql
# REDIS_HOST=redis
# QUEUE_HOST=beanstalkd
alias ld:serve='docker-compose up -d nginx mysql phpmyadmin redis workspace'
alias ld:bash='docker-compose exec --user=laradock workspace bash'
alias ld:stop='docker-compose stop'
alias ld:work='docker-compose exec --user=laradock workspace bash'

## Symfony
alias s:serve='symfony server:start'
alias s:cls='php symfony console'
alias s:info='php bin/console about'
alias s:clear='php bin/console cache:clear'

alias s:debug:r='php bin/console debug:router --show-controllers'
alias s:debug:c='php bin/console debug:container'
alias s:debug:a='php bin/console debug:autowiring --all'
alias s:debug:ag='php bin/console debug:autowiring --all | grep '

alias s:make:m='php bin/console make:migration'
alias s:make:e='php bin/console make:entity '
alias s:make:c='php bin/console make:controller '

alias s:db:create='php bin/console doctrine:database:create'
alias s:db:update='php bin/console doctrine:schema:update --force'
alias s:db:migrate='php bin/console doctrine:migrations:migrate'
alias s:db:frefresh='php bin/console doctrine:database:drop --force && php bin/console doctrine:database:create && php bin/console doctrine:migrations:migrate -n && php bin/console doctrine:fixtures:load -n'

alias s:fixtures='php bin/console doctrine:fixtures:load'

alias s:test:init='symfony console doctrine:database:drop --force --env=test || true && symfony console doctrine:database:create --env=test && symfony console doctrine:migrations:migrate -n --env=test && symfony console doctrine:fixtures:load -n --env=test'

alias s:encore:s='yarn encore dev-server'
alias s:encore:d='yarn encore dev'
alias s:encore:w='yarn encore dev --watch'

## NPM
alias npm:i='npm install '
alias npm:s='npms search '

## Yarn
alias yarn:i='yarn install '
alias yarn:b='yarn build'
alias yarn:s='yarn serve'
alias yarn:d='yarn dev'
alias yarn:r='yarn run'
alias yarn:c='yarn cache clean'

# React Native & EXPO
alias rn:s='npm start' 
alias rn:w='npm run web'
alias rn:a='npm run android'
alias rn:i='npm run ios'
alias rn:expo='expo r -c' # with clear cache
alias rn:assets:u='npx react-native-asset'
alias rn:serve='ngrok http http://127.0.0.1:8000'


[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

export PATH=${PATH}:/usr/local/mysql/bin/
export PATH=$PATH:/Users/[USER]/Library/Python/2.7/bin # Set [USER]!
# ___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
export PATH="$HOME/.symfony5/bin:$PATH"
export ANDROID_HOME=/Users/[USER]/Library/Android/sdk # Set [USER]!
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
