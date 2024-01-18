_: {
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
      url = {
        "https://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:x-oauth-basic@github.com/" = {
          insteadOf = [
            "git@github.com:"
          ];
        };
        "https://" = {
          insteadOf = [ "git://" ];
        };
        "https://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:x-oauth-basic@github.com/manabie-com" = {
          insteadOf = [ "https://github.com/manabie-com" ];
        };
      };
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
