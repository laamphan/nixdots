_: {
  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "laamphan";
        email = "41721718+laamphan@users.noreply.github.com";
        signingKey = "";
      };

      core.editor = "nvim";
      pull.rebase = false;
      commit.gpgsign = true;
    };
  };
}
