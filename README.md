# BLOAT OS

**The MOST BLOATED Arch Derivative**

BLOAT OS is an Arch Linux-based distribution that embraces the bloat. Why have a minimal system when you can have EVERYTHING?

## Philosophy

- **Maximum Bloat**: We install everything by default. AI models, game launchers, 5 browsers, office suites, media tools, themes, and useless fun stuff.
- **plasma-setup First-Boot Wizard**: After installation, KDE's `plasma-setup` wizard handles language, keyboard, WiFi, hostname, timezone, and user creation.
- **BLOAT Installer Plugin**: A custom plasma-setup plugin lets you choose what extra bloat to install on first login.
- **Calamares Base Installer**: The live ISO is a pure installer. No desktop on the live session - just boot straight into Calamares.

## Architecture

1. **Live ISO**: Boots directly into Calamares installer (auto-starts on TTY1)
2. **Calamares**: Does base system install (partition, format, unpack filesystem, bootloader). NO user/locale/keyboard setup.
3. **First Boot**: `plasma-setup` runs before display manager, guiding through:
   - Language selection
   - Keyboard layout
   - WiFi connection
   - Hostname
   - Timezone
   - User account creation
   - **BLOAT selection** (custom plugin)
4. **First Login**: The BLOAT installer runs and installs your selected packages.

## Building

```bash
cd tails1154os
python3 build.py
```

## Repositories

- **Arch Linux**: core, extra, multilib
- **Chaotic-AUR**: Pre-built AUR packages for maximum bloat
- **bloatos custom repo**: http://tails1154.com:9782/bloatos/repo

## Included Bloat

### Desktop
- Full KDE Plasma (plasma-meta, kde-applications-meta)
- SDDM display manager

### Browsers
- Firefox, Chromium, Brave, Zen Browser

### Development
- Neovim, Emacs, Docker, Podman, GitHub CLI, Node.js

### Media & Creative
- OBS Studio, Blender, GIMP, Inkscape, Krita, Kdenlive, VLC

### Gaming
- Steam, Lutris, Wine, GameMode, MangoHud, Heroic Games Launcher

### Office
- LibreOffice Fresh, OnlyOffice

### AI & ML
- Ollama, PyTorch, TensorFlow

### Fun & Useless
- cmatrix, cowsay, figlet, lolcat, nyancat, sl, cbonsai, asciiquarium, oneko, xeyes

### Themes & Eye Candy
- Papirus icons, wallpapers, Conky, Variety, Neofetch

## Custom plasma-setup Plugin

The `org.kde.plasmasetup.bloatinstall` plugin integrates into KDE's plasma-setup wizard. It shows checkboxes for bloat categories. By default, EVERYTHING is selected because this is BLOAT OS.

## License

GPL-3.0

## Links

- GitHub: https://github.com/tails1154/bloatos
- Repo: http://tails1154.com:9782/bloatos/repo
