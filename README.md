# VS Code Configuration Documentation

This document outlines how to use a specific VS Code setup, including custom keybindings and settings. It also details the recommended extensions that are configured to work with this setup.

## 1. Prerequisites

Before installing the configuration, please ensure the following are installed on your system:

*   **Fira Code Font:** This configuration uses Fira Code for its font ligatures.
    *   **Linux (Debian/Ubuntu-based):**
        ```bash
        sudo apt update && sudo apt install -y fonts-firacode
        ```
    *   **Linux (Arch-based):**
        ```bash
        sudo pacman -S ttf-firacode
        ```
        Or alternatively, from the AUR:
        ```bash
        yay -S ttf-firacode-git
        # or
        paru -S ttf-firacode-git
        ```
    *   **Linux (RedHat/Fedora-based):**
        ```bash
        sudo dnf install -y fira-code-fonts
        ```
        Or for older versions:
        ```bash
        sudo yum install -y fira-code-fonts
        ```
    *   **Linux (NixOS):**
        Add to your configuration.nix:
        ```nix
        fonts.packages = with pkgs; [
          pkgs.firacode
        ];
        ```
        Or if using home-manager:
        ```nix
        fonts.fontconfig.enable = true;
        home.packages = with pkgs; [
          pkgs.fira-code
        ];
        ```
    *   **Other Systems:** Download from the [Fira Code GitHub repository](https://github.com/tonsky/FiraCode).

*   **Kitty Terminal:** The keybindings are set up to use Kitty as the external terminal.
    *   **Linux (Debian/Ubuntu-based):**
        ```bash
        sudo apt update && sudo apt install -y kitty
        ```
    *   **Linux (Arch-based):**
        ```bash
        sudo pacman -S kitty
        ```
    *   **Linux (RedHat/Fedora-based):**
        ```bash
        sudo dnf install -y kitty
        ```
        Or for older versions:
        ```bash
        sudo yum install -y kitty
        ```
    *   **Linux (NixOS):**
        Add to your configuration.nix:
        ```nix
        environment.systemPackages = with pkgs; [
          kitty
        ];
        ```
        Or if using home-manager:
        ```nix
        home.packages = with pkgs; [
          pkgs.kitty
        ];
        ```
    *   **Other Systems:** Follow the installation instructions on the [Kitty website](https://sw.kovidgoyal.net/kitty/build/).

## 2. Installation (Linux)

An installation script is provided to automate the setup.

1.  **Make the script executable:**
    ```bash
    chmod +x install_config.sh
    ```
2.  **Run the script:**
    ```bash
    ./install_config.sh
    ```
    The script will automatically back up your existing `settings.json` and `keybindings.json` with a timestamp before copying the new files.

3.  **Restart VS Code** for the changes to take full effect.

## 3. Installing VS Code for Different Linux Distributions

This section provides instructions on installing VS Code itself for various Linux distributions:

*   **Debian/Ubuntu-based (DEB Package):**
    ```bash
    # Download and install the .deb package
    wget -O code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
    sudo dpkg -i code.deb
    # Or install using apt after adding the repository:
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor --output /usr/share/keyrings/microsoft.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
    sudo apt install -y code
    ```

*   **RedHat/Fedora-based (RPM Package):**
    ```bash
    # Download and install the .rpm package
    sudo rpm -Uvh https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64
    # Or install using dnf after adding the repository:
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf check-update
    sudo dnf install -y code
    ```

*   **Arch-based:**
    ```bash
    # Install from official repositories
    sudo pacman -S code
    # Or from the AUR
    yay -S visual-studio-code-bin
    # or
    paru -S visual-studio-code-bin
    ```

*   **NixOS:**
    Add to your configuration.nix:
    ```nix
    environment.systemPackages = with pkgs; [
      pkgs.vscode
    ];
    ```
    Or if using home-manager:
    ```nix
    home.packages = with pkgs; [
      pkgs.vscode
    ];
    ```
    Or install directly using nix-env:
    ```bash
    nix-env -iA nixpkgs.vscode
    ```

## 4. Recommended Extensions (Global)

This configuration is optimized for a set of globally installed extensions. VS Code should prompt you to install them, but you can also install them manually from the Extensions view (`Ctrl+Shift+X`).

*   **[Dracula Theme](https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula):** A popular dark theme (set as default).
*   **[Material Theme](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme):** An excellent alternative theme collection.
*   **[Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme):** Provides better icons for files and folders.
*   **[Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense):** Autocompletes filenames.
*   **[Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode):** An opinionated code formatter for web technologies.
*   **[Black Formatter](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter):** The uncompromising Python code formatter.
*   **[GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot):** AI-powered code completion.
*   **[GitHub Copilot Chat](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat):** Chat interface for GitHub Copilot.
*   **[GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens):** Supercharges the Git capabilities built into VS Code.

## 5. Project-Specific Extensions (Workspace Recommendations)

For specific projects (like React or Rust), you can recommend extensions to anyone who opens the project. Create a file named `.vscode/extensions.json` in your project's root directory.

When someone opens the project, VS Code will see this file and prompt them to install the listed extensions.

### Example for a React Project

For a React project, you might recommend ESLint and Stylelint.

1.  Create the file `.vscode/extensions.json`.
2.  Add the following content:
    ```json
    {
      "recommendations": [
        "dbaeumer.vscode-eslint", // Integrates ESLint into VS Code
        "stylelint.vscode-stylelint" // Integrates Stylelint into VS Code
      ]
    }
    ```

### Example for a Rust Project

For a Rust project, `rust-analyzer` is essential.

1.  Create the file `.vscode/extensions.json`.
2.  Add the following content:
    ```json
    {
      "recommendations": [
        "rust-lang.rust-analyzer", // Rust language support
        "serayuzgur.crates",       // Helps with crate versions in Cargo.toml
        "tamasfe.even-better-toml" // Better TOML language support
      ]
    }
    ```

## 6. Keybindings & Settings Overview

(The detailed keybinding tables and settings explanation from the previous document remain the same.)

---
*This document has been updated to include prerequisites, an automated installation script, and instructions for project-specific extension recommendations.*

## 7. Manual Setup

For users who prefer to set up their VS Code environment manually or are on systems where the automated script is not applicable, follow these steps.

### 7.1. Manual Prerequisites Installation

*   **Fira Code Font:**
    *   **Download:** Visit the [Fira Code GitHub repository](https://github.com/tonsky/FiraCode) and download the latest release.
    *   **Installation:**
        *   **Windows:** Unzip the downloaded file, right-click on the `.ttf` font files (e.g., `FiraCode-Regular.ttf`), and select "Install".
        *   **macOS:** Unzip the downloaded file, double-click on the `.ttf` font files, and click "Install Font".
        *   **Linux:** Copy the `.ttf` files to `~/.local/share/fonts/` (for user-specific installation) or `/usr/local/share/fonts/` (for system-wide installation), then run `fc-cache -f -v`.

*   **Kitty Terminal:**
    *   **Installation:** Follow the detailed instructions on the [Kitty website](https://sw.kovidgoyal.net/kitty/build/) for your specific operating system.

### 7.2. Manual Configuration Files Placement

VS Code stores its user-specific configuration files (`settings.json` and `keybindings.json`) in a particular directory. The location varies by operating system:

*   **Windows:** `%APPDATA%\Code\User\` (e.g., `C:\Users\YourUsername\AppData\Roaming\Code\User\`)
*   **macOS:** `~/Library/Application Support/Code/User/`
*   **Linux:** `~/.config/Code/User/`

To manually apply the provided configurations:

1.  **Locate your VS Code User directory** based on your operating system from the paths above.
2.  **Backup Existing Files (Optional but Recommended):** If you have existing `settings.json` or `keybindings.json` files, move them to a backup location or rename them (e.g., `settings.json.bak`).
3.  **Copy Files:** Copy the provided `settings.json` and `keybindings.json` files into your VS Code User directory.
4.  **Restart VS Code** for the changes to take effect.

### 7.3. Manual Global Extension Installation

To install the recommended global extensions manually:

1.  Open VS Code.
2.  Go to the Extensions view by clicking the Extensions icon in the Activity Bar on the side of the window, or by pressing `Ctrl+Shift+X`.
3.  In the search bar, type the name of each extension and press Enter.
4.  Click the "Install" button for each extension.

Here is a list of the recommended extensions:

*   **Dracula Theme:** `dracula-theme.theme-dracula`
*   **Material Theme:** `Equinusocio.vsc-material-theme`
*   **Material Icon Theme:** `PKief.material-icon-theme`
*   **Path Intellisense:** `christian-kohler.path-intellisense`
*   **Prettier - Code formatter:** `esbenp.prettier-vscode`
*   **Black Formatter:** `ms-python.black-formatter`
*   **GitHub Copilot:** `GitHub.copilot`
*   **GitHub Copilot Chat:** `GitHub.copilot-chat`
*   **GitLens — Git supercharged:** `eamodio.gitlens`

### 7.4. Manual Project-Specific Extension Recommendations

This section remains the same as described in "4. Project-Specific Extensions (Workspace Recommendations)". You will create a `.vscode/extensions.json` file in your project's root directory with the desired recommendations.

## 8. Advanced Configuration: Project-Specific Extensions and Keybindings for Optimal Performance

This section covers advanced techniques for configuring VS Code to optimize performance by managing project-specific extensions and creating language-specific keybindings that automatically load only when needed.

### 8.1. Project-Specific Extensions for Performance

Project-specific extensions help reduce system stress by loading only necessary extensions for active projects. This prevents unnecessary extensions from consuming system resources.

1. **Creating Project-Specific Extensions File:**
   In your project root, create `.vscode/extensions.json`:

   ```json
   {
     "recommendations": [
       "ms-python.black-formatter",
       "ms-python.python",
       "ms-python.vscode-pylance"
     ],
     "unwantedRecommendations": [
       "ms-vscode.vscode-typescript-next",
       "bradlc.vscode-tailwindcss"
     ]
   }
   ```

2. **Language-Specific Extension Recommendations:**

   For a Python project:
   ```json
   {
     "recommendations": [
       "ms-python.python",
       "ms-python.vscode-pylance",
       "ms-python.black-formatter",
       "ms-python.flake8",
       "ms-toolsai.jupyter"
     ]
   }
   ```

   For a JavaScript/TypeScript project:
   ```json
   {
     "recommendations": [
       "dbaeumer.vscode-eslint",
       "esbenp.prettier-vscode",
       "bradlc.vscode-tailwindcss",
       "ms-vscode.vscode-typescript-next"
     ]
   }
   ```

   For a Rust project:
   ```json
   {
     "recommendations": [
       "rust-lang.rust-analyzer",
       "serayuzgur.crates",
       "tamasfe.even-better-toml"
     ]
   }
   ```

### 8.2. Advanced Keybinding Customization

You can create context-aware keybindings that only activate for specific file types or programming languages.

1. **Language-Specific Keybindings:**
   Add to your `keybindings.json`:
   ```json
   [
     {
       "key": "ctrl+shift+t",
       "command": "python.execInTerminal-icon",
       "when": "editorTextFocus && resourceLangId == 'python'"
     },
     {
       "key": "ctrl+shift+t",
       "command": "npm.run",
       "when": "editorTextFocus && resourceLangId == 'javascript'"
     },
     {
       "key": "ctrl+shift+b",
       "command": "rust-analyzer.run",
       "when": "editorTextFocus && resourceLangId == 'rust'"
     }
   ]
   ```

2. **Context-Aware Keybindings:**
   ```json
   [
     {
       "key": "ctrl+shift+e",
       "command": "workbench.action.toggleMaximizedPanel",
       "when": "terminalFocus"
     },
     {
       "key": "ctrl+shift+e",
       "command": "workbench.view.explorer",
       "when": "!terminalFocus"
     }
   ]
   ```

### 8.3. Workspace-Specific Settings for Performance

To optimize system performance, create workspace-specific settings that only enable certain features when working in specific projects.

1. **Create a `.vscode/settings.json` in your project root:**

   For a Python project with performance optimization:
   ```json
   {
     "python.analysis.typeCheckingMode": "basic",
     "editor.inlayHints.enabled": "on",
     "files.watcherExclude": {
       "**/node_modules/**": true,
       "**/dist/**": true,
       "**/build/**": true
     },
     "search.exclude": {
       "**/node_modules": true,
       "**/dist": true,
       "**/__pycache__": true
     }
   }
   ```

   For a JavaScript/TypeScript project:
   ```json
   {
     "typescript.preferences.includePackageJsonAutoImports": "auto",
     "javascript.preferences.includePackageJsonAutoImports": "auto",
     "eslint.run": "onType",
     "emmet.includeLanguages": {
       "javascript": "javascriptreact",
       "typescript": "typescriptreact"
     },
     "javascript.updateImportsOnFileMove.enabled": "always",
     "typescript.updateImportsOnFileMove.enabled": "always"
   }
   ```

### 8.4. Optimizing Extension Load for Different Environments

To prevent system stress and optimize performance:

1. **Use Extension Dependencies:**
   In your project's `extensions.json`, specify only essential extensions and let users install additional ones as needed.

2. **Disable Extensions When Not Needed:**
   Use VS Code's extension recommendations to suggest only extensions relevant to the current project.

3. **Performance Monitoring:**
   Use `Developer: Show Running Extensions` to identify extensions that consume excessive resources.

### 8.5. Cross-Platform Project Configuration

For projects that will be used across different operating systems:

1. **Platform-Specific Settings:**
   ```json
   {
     "terminal.integrated.profiles.linux": {
       "bash": {
         "path": "bash"
       }
     },
     "terminal.integrated.profiles.windows": {
       "PowerShell": {
         "source": "PowerShell",
         "icon": "terminal-powershell"
       }
     },
     "terminal.integrated.profiles.osx": {
       "bash": {
         "path": "/bin/bash"
       }
     }
   }
   ```

2. **Project-Specific Keybindings with Platform Checks:**
   ```json
   [
     {
       "key": "ctrl+shift+t",
       "command": "workbench.action.terminal.openNativeConsole",
       "when": "resourceExtname == '.py' && platform == 'linux'"
     },
     {
       "key": "ctrl+shift+t",
       "command": "workbench.action.terminal.openNativeConsole",
       "when": "resourceExtname == '.py' && platform == 'darwin'"
     }
   ]
   ```

These advanced configuration techniques ensure that your VS Code environment is optimized for each project, reducing system stress by loading only necessary extensions and features while providing language-specific shortcuts and settings that enhance productivity.

---