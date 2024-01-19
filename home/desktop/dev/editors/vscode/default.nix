{ pkgs, ... } : {
programs.vscode = {
  enable = true;
  # package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions;   [
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    eamodio.gitlens
    github.copilot
    redhat.vscode-yaml
    timonwong.shellcheck
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "salesforcedx-vscode";
        publisher = "salesforce";
        version = "59.13.0";
        sha256 = "sha256-YWrNFDXUT4VPiIJYP4qN7OGaQL58k4s/9JSlz0dYwZ4=";
      }
    ];
  userSettings = {
    "window.titleBarStyle" = "custom"; 
    "editor.fontSize" = 12;
    "editor.fontFamily" = "JetBrainsMono Nerd Font Mono";
    "extensions.autoUpdate" = false;
    "workbench.statusBar.visible" = true;
    "terminal.external.linuxExec" = "wezterm";
    "telemetry.telemetryLevel" = "off";
    "[typescriptreact]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "editor.lineNumbers" = "relative";
    "vim.useSystemClipboard" = true;
    "[javascript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "terminal.integrated.shell.linux" = "zsh";
    "[html]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "editor.formatOnSave" = true;
    "[json]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "[xml]" = {
      "editor.defaultFormatter" = "redhat.vscode-xml";
    };
    "terminal.integrated.scrollback" = 100000;
   };
  };
}
