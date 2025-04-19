# Levanter Installer

**Author:** [y-nabeelxd](https://github.com/y-nabeelxd)

This repository provides a one-command installer for setting up the [Levanter](https://github.com/lyfe00011/levanter) bot on Ubuntu or Termux environments.

## Installation

Necessary Installation:

```
apt update && apt upgrade -y && apt install bash -y && apt install curl -y
```

To run the installer, simply use the following command:

```
bash <(curl -sSL https://gist.github.com/y-nabeelxd/e6b16b1300d43b971b61c3d7e4275467/raw)
```

## Requirements

- Ubuntu or [Termux](https://f-droid.org/repo/com.termux_1021.apk) (with or without Ubuntu via `proot`)
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

## Credits

- [Levanter Bot](https://github.com/lyfe00011/levanter) by [lyfe00011](https://github.com/lyfe00011)
- Installer by [y-nabeelxd](https://github.com/y-nabeelxd)

---

**Note:** Use this script responsibly. All credit for the original bot goes to its respective creator.

<p align="center">
  <b>Contact having any issues</b>
  <a href="https://wa.me/917736799273">
    <img src="https://img.shields.io/badge/WhatsApp-Contact%20Now-brightgreen?style=for-the-badge&logo=whatsapp" alt="WhatsApp">
  </a>
</p>
