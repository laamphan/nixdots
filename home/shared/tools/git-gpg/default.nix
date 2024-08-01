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
        signingKey = "";
      };

      core.editor = "nvim";
      pull.rebase = false;
      commit.gpgsign = true;
    };
  };
}
