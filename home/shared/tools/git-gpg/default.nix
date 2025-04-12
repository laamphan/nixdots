_: {
  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "lamphan-pcs";
        email = "191198669+lamphan-pcs@users.noreply.github.com";
        signingKey = "";
      };

      core.editor = "nvim";
      pull.rebase = false;
      commit.gpgsign = true;
    };
  };
}
