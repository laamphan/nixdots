{pkgs, ...}: {
  home.file.".vscode-oss/argv.json" = {
    force = true;
    text = ''
      {
      	// "disable-hardware-acceleration": true,
      	"enable-crash-reporter": false,
      	// Unique id used for correlating crash reports sent from this instance.
      	// Do not edit this value.
        "crash-reporter-id": "YOUR_CRASH_ID_HERE",
         "password-store": "gnome"
      }
    '';
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions;
      [
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        eamodio.gitlens
        github.copilot
        redhat.vscode-yaml
        redhat.vscode-xml
        timonwong.shellcheck
        ms-kubernetes-tools.vscode-kubernetes-tools
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "salesforcedx-vscode";
          publisher = "salesforce";
          version = "59.13.0";
          sha256 = "sha256-YWrNFDXUT4VPiIJYP4qN7OGaQL58k4s/9JSlz0dYwZ4=";
        }
        {
          name = "makefile-tools";
          publisher = "ms-vscode";
          version = "0.9.2";
          sha256 = "sha256-6mlm7oSiixuRc/tq0EvIkOfVkoaZem6PqwV95+BQnVU=";
        }
        {
          name = "Go";
          publisher = "golang";
          version = "0.40.1";
          sha256 = "sha256-KeYui/REV9E1HcNWBb0ThD0fOWkMM0AVTyfiE1efhCA=";
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
