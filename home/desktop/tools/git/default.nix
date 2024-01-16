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
