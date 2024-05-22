_: {
  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Pham Duc Binh";
        email = "binh.pham@hextrust.com";
        signingKey = "";
      };

      core.editor = "nvim";
      pull.rebase = false;
      commit.gpgsign = true;
    };
  };
}
