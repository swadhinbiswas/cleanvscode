# VS Code Configuration Documentation

This document outlines how to use a specific VS Code setup, including custom keybindings and settings. It also details the recommended extensions that are configured to work with this setup.

## 1. Prerequisites

Before installing the configuration, please ensure the following are installed on your system:

*   **Fira Code Font:** This configuration uses Fira Code for its font ligatures.
    *   **Linux (Debian/Ubuntu):**
        ```bash
        sudo apt update && sudo apt install -y fonts-firacode
        ```
    *   **Other Systems:** Download from the [Fira Code GitHub repository](https://github.com/tonsky/FiraCode).

*   **Kitty Terminal:** The keybindings are set up to use Kitty as the external terminal.
    *   **Linux (Debian/Ubuntu):**
        ```bash
        sudo apt update && sudo apt install -y kitty
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

## 3. Recommended Extensions (Global)

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

## 4. Project-Specific Extensions (Workspace Recommendations)

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

## 5. Keybindings & Settings Overview

(The detailed keybinding tables and settings explanation from the previous document remain the same.)

---
*This document has been updated to include prerequisites, an automated installation script, and instructions for project-specific extension recommendations.*

## 6. Manual Setup

For users who prefer to set up their VS Code environment manually or are on systems where the automated script is not applicable, follow these steps.

### 6.1. Manual Prerequisites Installation

*   **Fira Code Font:**
    *   **Download:** Visit the [Fira Code GitHub repository](https://github.com/tonsky/FiraCode) and download the latest release.
    *   **Installation:**
        *   **Windows:** Unzip the downloaded file, right-click on the `.ttf` font files (e.g., `FiraCode-Regular.ttf`), and select "Install".
        *   **macOS:** Unzip the downloaded file, double-click on the `.ttf` font files, and click "Install Font".
        *   **Linux:** Copy the `.ttf` files to `~/.local/share/fonts/` (for user-specific installation) or `/usr/local/share/fonts/` (for system-wide installation), then run `fc-cache -f -v`.

*   **Kitty Terminal:**
    *   **Installation:** Follow the detailed instructions on the [Kitty website](https://sw.kovidgoyal.net/kitty/build/) for your specific operating system.

### 6.2. Manual Configuration Files Placement

VS Code stores its user-specific configuration files (`settings.json` and `keybindings.json`) in a particular directory. The location varies by operating system:

*   **Windows:** `%APPDATA%\Code\User\` (e.g., `C:\Users\YourUsername\AppData\Roaming\Code\User\`)
*   **macOS:** `~/Library/Application Support/Code/User/`
*   **Linux:** `~/.config/Code/User/`

To manually apply the provided configurations:

1.  **Locate your VS Code User directory** based on your operating system from the paths above.
2.  **Backup Existing Files (Optional but Recommended):** If you have existing `settings.json` or `keybindings.json` files, move them to a backup location or rename them (e.g., `settings.json.bak`).
3.  **Copy Files:** Copy the provided `settings.json` and `keybindings.json` files into your VS Code User directory.
4.  **Restart VS Code** for the changes to take effect.

### 6.3. Manual Global Extension Installation

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

### 6.4. Manual Project-Specific Extension Recommendations

This section remains the same as described in "4. Project-Specific Extensions (Workspace Recommendations)". You will create a `.vscode/extensions.json` file in your project's root directory with the desired recommendations.

---