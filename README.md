# Levanter Installer

**Author:** [y-nabeelxd](https://github.com/y-nabeelxd)

This repository provides a one-command installer for setting up the [Levanter](https://github.com/lyfe00011/levanter) bot on Ubuntu or Termux environments.


[![Tutorial](https://img.shields.io/badge/Watch%20Tutorial-CLICK%20HERE-red?style=for-the-badge)](https://youtu.be/AllGTAG0CSY?si=754gHjepTe1ECBcO)

## Installation Options

### Command Line Installation
Necessary Installation:
```
apt update && apt upgrade -y && apt install bash -y && apt install curl -y
```

To run the installer, simply use the following command:
```
bash <(curl -sSL https://raw.githubusercontent.com/y-nabeelxd/levanter-installer/main/installer.sh)
```

## Requirements

- Ubuntu or [Termux](https://f-droid.org/repo/com.termux_1022.apk) & [Termux:API](https://f-droid.org/repo/com.termux.api_1002.apk)
- Internet connection

## Running the Bot Again?

If you're having trouble running the bot again or need to restart it, follow the steps for your setup:

### For Native Termux

**Navigate to your bot folder:**
```bash
ls                # Check if your bot folder is listed
cd botfoldername  # Replace with your actual folder name
```

**Run the bot:**
```bash
npm start
```

### For Ubuntu

**Navigate to your bot folder and start with PM2:**
```bash
cd botfoldername
pm2 start . --name botfoldername
```

## Credits

- [Levanter Bot](https://github.com/lyfe00011/levanter) by [lyfe00011](https://github.com/lyfe00011)
- Installer by [y-nabeelxd](https://github.com/y-nabeelxd)

---

**Note:** Use this script responsibly. All credit for the original bot goes to its respective creator.

<p align="center">
  <b>Contact having any issues</b><br>
  <a href="https://wa.me/917736799273">
    <img src="https://img.shields.io/badge/WhatsApp-Contact_Now-brightgreen?style=for-the-badge&logo=whatsapp" alt="WhatsApp">
  </a>
</p>
