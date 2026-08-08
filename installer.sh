#!/bin/bash

clear

if [ -d "/data/data/com.termux/files/usr" ]; then
  system="termux"
elif grep -qi "ubuntu" /etc/os-release 2>/dev/null; then
  system="ubuntu"
else
  echo "This script only supports Termux and Ubuntu."
  exit 1
fi

is_installed() {
  command -v "$1" >/dev/null 2>&1
}

install_package() {
  name="$1"
  shift
  if is_installed "$name"; then
    echo "$name is already installed."
  else
    echo "Installing $name..."
    eval "$@" < /dev/null
  fi
}

check_network() {
  if is_installed ping; then
    local target="google.com"
    local timeout=2
    local result=$(ping -c 1 -W $timeout $target 2>/dev/null | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')
    if [ -n "$result" ]; then
      if [ $(echo "$result > 400" | bc -l 2>/dev/null) ] || [ $(echo "$result" | awk '{if($1 > 400) print 1}') ]; then
        echo "Warning: High network latency detected (${result}ms). Installation may be slow."
        sleep 2
      fi
    fi
  fi
}

if [ "$system" = "termux" ]; then
  clear
  echo "Setting up Termux environment..."
  sleep 2
  apt update < /dev/null && apt upgrade -y < /dev/null
  pkg install nodejs git ffmpeg python binutils curl yarn clang make libvips -y < /dev/null
  
  if ! is_installed pm2; then
    npm install -g pm2 < /dev/null
  fi
else
  clear
  echo "Setting up Ubuntu environment..."
  sleep 2
  apt update < /dev/null && apt upgrade -y < /dev/null
  install_package curl "apt install -y curl"
  install_package git "apt install -y git"
  install_package ffmpeg "apt install -y ffmpeg"
  install_package sudo "apt install -y sudo"
  install_package make "apt install -y make"
  install_package python3 "apt install -y python3 python3-pip python3-setuptools"
  install_package build-essential "apt install -y build-essential"
  install_package libwebp-dev "apt install -y libwebp-dev"
  install_package python3-distutils "apt install -y python3-distutils"

  if ! is_installed node || ! is_installed npm; then
    echo "Installing Node.js 20.x..."
    curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
    bash nodesource_setup.sh < /dev/null
    apt install -y nodejs < /dev/null
    rm -f nodesource_setup.sh
  else
    echo "Node.js is already installed."
  fi

  install_package yarn "npm install -g yarn"
  install_package node-gyp "npm install -g node-gyp"
  install_package pm2 "yarn global add pm2"
fi

clear

read -p "Please enter your session: " session_id
read -p "Put a folder name (don't put space): " clone_name
read -p "Enter Password for Dashboard: " password

clear

echo "Do you want to use the bot as a single session or multiple sessions?"
echo ""
echo "Hint:"
echo "If you choose single session, all variables will be saved in config.env."
echo "If you choose multiple sessions, they will be stored in config.json."
echo ""
echo "1) Single Session"
echo "2) Multiple Sessions"
echo ""
read -p "Enter your choice (1 or 2): " session_type

sleep 2
clear

base_path="$HOME"
final_name="$clone_name"
counter=1

while [ -d "$base_path/$final_name" ]; do
  if [ "$counter" -le 100 ]; then
    final_name="${clone_name}${counter}"
    ((counter++))
  else
    echo "Too many existing folders with similar names. Aborting."
    exit 1
  fi
done

if [ "$final_name" != "$clone_name" ]; then
  echo "Your folder name changed to: $final_name"
  sleep 3
fi

cd "$base_path"

echo "Cloning repository..."
git clone https://github.com/lyfe00011/levanter "$final_name"

cd "$final_name"

if [ "$session_type" = "1" ]; then
  echo -e "SESSION_ID = $session_id\nVPS = true\nPORT = 8080\nPASSWORD = $password\nAUTO_UPDATE = true\nBOT_LANG = en" > config.env
else
  echo -e "VPS = true\nPORT = 8080\nPASSWORD = $password\nAUTO_UPDATE = true\nBOT_LANG = en" > config.env
  echo '{ "session1": { "SESSION_ID": "'$session_id'", "PREFIX": "^[.,!]" } }' > config.json
fi

check_network

if [ "$system" = "termux" ]; then
  echo "Installing Termux-specific native dependencies..."
  pip install setuptools < /dev/null
  export GYP_DEFINES="android_ndk_path=''"
  npm install --cpu=wasm32 sharp --legacy-peer-deps < /dev/null
fi

echo "Installing dependencies (this may take a while)..."
max_retries=5
retry_count=0

while [ $retry_count -lt $max_retries ]; do
  (yarn install --network-timeout 300000 --cache .yarn-cache --ignore-scripts)
  if [ $? -eq 0 ]; then
    echo "Dependencies installed successfully!"
    break
  else
    retry_count=$((retry_count + 1))
    sleep 5
  fi
done

ip=$(curl -s ifconfig.me)

echo "The bot dashboard is hosted on port 8080"
if [ "$system" = "termux" ]; then
  echo "URL: http://localhost:8080 (or your device IP)"
else
  echo "URL: http://$ip:8080"
fi
echo "Dashboard password: $password"

if [ "$system" = "termux" ]; then
  echo "Starting bot natively on Termux..."
  npm start
else
  echo "Starting bot with PM2..."
  pm2 start . --name "$final_name" --attach --time --cwd "$HOME/$final_name"
fi
