{secrets, ...}: {
  home.file.".gitignore" = {
    force = true;
    text = ''
      server exited unexpectedly
    '';
  };
  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Pham Duc Binh";
        email = "binh1298@gmail.com";
      };
      url."https://${secrets.github_token}:x-oauth-basic@github.com/".insteadOf = "git@github.com:";
      url."https://".insteadOf = "git://";
      url."https://${secrets.github_token}:x-oauth-basic@github.com/manabie-com".insteadOf = "https://github.com/manabie-com";

      core.editor = "nvim";
      core.excludesfile = "~/.gitignore";
      pull.rebase = false;
    };
  };
}
