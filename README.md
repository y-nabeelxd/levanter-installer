# Levanter Installer

**Author:** [y-nabeelxd](https://github.com/y-nabeelxd)

This repository provides a one-command installer for setting up the [Levanter](https://github.com/lyfe00011/levanter) bot on Ubuntu or Termux environments.


[![Tutorial](https://img.shields.io/badge/Watch%20Tutorial-CLICK%20HERE-red?style=for-the-badge)](https://youtu.be/AllGTAG0CSY?si=754gHjepTe1ECBcO)

## Installation Options

### Web Interface (Easy Install)
[![Web Installer](https://img.shields.io/badge/🌐%20WEB%20INSTALLER-CLICK%20HERE-blue?style=for-the-badge)](https://y-nabeelxd.github.io/levanter-installer)

### Command Line Installation
Necessary Installation:
```
apt update && apt upgrade -y && apt install bash -y && apt install curl -y
```

To run the installer, simply use the following command:
```
bash <(curl -sSL https://gist.github.com/y-nabeelxd/6b30a1ef0a0ac26e7f7001036b1186da/raw)
```

## Requirements

- Ubuntu or [Termux](https://f-droid.org/repo/com.termux_1021.apk) & [Termux:API](https://f-droid.org/repo/com.termux.api_1000.apk) (with or without Ubuntu via `proot`)
- Internet connection

## Running the Bot Again?

If you're having trouble running the bot again, follow these steps:

**Login to Ubuntu from Termux:**
```
proot-distro login ubuntu
```

**Navigate to your bot folder:**
```
ls                # Check if your bot folder is listed
cd botfoldername  # Replace with your actual folder name
```

**Run the bot:**
```
npm start
```

## Need Auto Reboot?
[![Auto-Run](https://img.shields.io/badge/Auto_Run_Script-Click_Here-important?style=for-the-badge)](https://github.com/y-nabeelxd/Auto-Run-Levanter-Termux-Ubuntu)

## Credits

- [Levanter Bot](https://github.com/lyfe00011/levanter) by [lyfe00011](https://github.com/lyfe00011)
- Installer by [y-nabeelxd](https://github.com/y-nabeelxd)
- Web Interface by [y-nabeelxd](https://github.com/y-nabeelxd)

---

**Note:** Use this script responsibly. All credit for the original bot goes to its respective creator.

<p align="center">
  <b>Contact having any issues</b><br>
  <a href="https://wa.me/917736799273">
    <img src="https://img.shields.io/badge/WhatsApp-Contact_Now-brightgreen?style=for-the-badge&logo=whatsapp" alt="WhatsApp">
  </a>
</p>
