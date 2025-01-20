#!/bin/bash


check_os() {
    if [[ "$1" == "Ubuntu" ]]; then
        clear
        echo "checking your system..."
        sleep 2
        clear
        if [[ $(lsb_release -is) != "Ubuntu" ]]; then
            echo "Sorry, Your system is not Ubuntu"
            return 1
        else
            echo "Found Ubuntu $(lsb_release -rs)!"
            sleep 3
            return 0
        fi
    elif [[ "$1" == "Windows" ]]; then
        clear
        echo "checking your system..."
        sleep 2
        clear
        if [[ "$OSTYPE" != "msys" && "$OSTYPE" != "cygwin" ]]; then
            echo "Sorry, Your system is not Windows"
            return 1
        else
            echo "Found Windows $(wmic os get Caption | grep -oP 'Windows \S+')!"
            sleep 3
            return 0
        fi
    fi
}


while true; do
    clear
    echo "Select your system:"
    echo "1. Ubuntu"
    echo "2. Windows"
    echo "0. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            check_os "Ubuntu"
            if [[ $? -eq 0 ]]; then
                clear
                read -p "What name do you want to put on Bot: " name
                read -p "Session ID: " session
                echo -e "\nInstalling dependencies...\n"
                apt upgrade -y && apt update -y
                apt install -y curl libwebp-dev ffmpeg
                apt install -y sudo
                cd $HOME
                curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
                sudo -E bash nodesource_setup.sh
                sudo apt-get install -y nodejs
                sudo npm install -g yarn
                yarn global add pm2
                git clone https://github.com/lyfe00011/levanter "$name"
                cd "$name"
                sudo apt install make
                sudo apt install build-essential
                sudo apt install python3-setuptools
                npm install -g node-gyp
                npm install -g node-gyp@latest
                sudo apt install binutils -y
                yarn install
                echo "SESSION_ID = $session
                VPS = true" > config.env
                clear
                echo -e "SUCCESSFULLY DEPLOYED YOUR BOT"
                sleep 2
                clear
                echo -e "\nYour bot has been installed! Please copy and paste the following command to run the bot:"
                echo -e "\ncd $name && pm2 start . --name $name --attach --time\n\n"
                exit 0
            fi
            ;;
        2)
            check_os "Windows"
            if [[ $? -eq 0 ]]; then
                clear
                read -p "What name do you want to put on Bot: " name
                read -p "Session ID: " session
                echo "Installing dependencies for Windows..."
                mkdir "$HOME/$name"
                cd "$HOME/$name"
                curl -o nodesource_setup.bat https://deb.nodesource.com/setup_20.x
                git clone https://github.com/lyfe00011/levanter .
                npm install
                echo "SESSION_ID = $session
                VPS = true" > config.env
                clear
                echo -e "SUCCESSFULLY DEPLOYED YOUR BOT"
                sleep 2
                clear
                echo -e "\nYour bot has been installed! Please copy and paste the following command to run the bot:"
                echo -e "\ncd $HOME\\$name && pm2 start . --name $name --attach --time\n\n"
                exit 0
            fi
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done
