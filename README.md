# my-scripts

A collection of bash and shell scripts for system automation, hardware control, and environment management on my [Artix Linux](https://artixlinux.org/) setup, optimized for [dwm](https://dwm.suckless.org/).

## Prerequisites
Most of these scripts rely on the following packages being installed on your system:
- `dmenu`
- `light` (Backlight control)
- `feh` (Wallpaper management)
- `amixer` (Audio control)
- `doas` (or `sudo` - note that these scripts are configured for `doas`)
- `git`

## Script Overview

| Script | Description |
| :--- | :--- |
| `bright-up.sh` / `bright-down.sh` | Adjusts display backlight in 5% increments using `light`. Prevents race conditions with `flock`. |
| `vol-up.sh` / `vol-down.sh` | Adjusts Master volume using `amixer`. Includes locking logic to prevent rapid key-press drift. |
| `vol-mute.sh` | Toggles mute across Master, Speaker, and Headphone channels. |
| `update-repo.sh` | Automates Git workflows: pulls latest changes, adds files, and pushes to `origin main` if changes are detected. |
| `wallpaper.sh` | Dynamically switches wallpaper using `feh` based on the currently active `dwm` tag. |
| `exit.sh` | A `dmenu`-based power menu for Reboot, Shutdown, or exiting `dwm`. |
| `centered-text.sh` | Helper script for status bar tagging/formatting. |

## Usage
1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/hexbitCTF/my-scripts.git](https://github.com/hexbitCTF/my-scripts.git) ~/setup/scripts
    ```

2.  **Set permissions:**
    Ensure all scripts are executable:
    ```bash
    chmod +x ~/setup/scripts/*.sh
    ```

3.  **Add to Path:**
    To run these from anywhere in your terminal, add the directory to your shell's `$PATH` in your `.bashrc` or `.zshrc`:
    ```bash
    export PATH="$HOME/setup/scripts:$PATH"
    ```

## Development Workflow
When making changes to these scripts or adding new ones, the `update-repo.sh` script is designed to handle synchronization. 

*Note:* Ensure you have set your git identity inside this directory first:
```bash
git config user.email "your-email@example.com"
git config user.name "hexbitCTF"
