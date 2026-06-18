{secrets, ...}: {
  home.file.".gitignore" = {
    force = true;
    text = ''
      server exited unexpectedly
      .DS_Store
    '';
  };

  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      # Default/fallback user (optional)
      # user = {
      #   name = "lamphan-pcs";
      #   email = "191198669+lamphan-pcs@users.noreply.github.com";
      # };

      # Conditional includes for different directories
      includeIf."gitdir:~/pcs/".path = "~/.gitconfig-pcs";
      includeIf."gitdir:~/laamphan/".path = "~/.gitconfig-lp";
      includeIf."gitdir:~/lp-pcs/".path = "~/.gitconfig-lp-pcs";

      url."https://".insteadOf = "git://";
      core.editor = "nvim";
      core.excludesfile = "~/.gitignore";
      pull.rebase = false;
    };
    lfs.enable = true;
  };

  # Work account configuration
  home.file.".gitconfig-pcs".text = ''
    [user]
      name = "${secrets.github_pcs_user}"
      email = "${secrets.github_pcs_email}"
    [url "https://${secrets.github_pcs_user}:${secrets.github_pcs_token}@github.com/${secrets.github_pcs_user}"]
      insteadOf = "https://github.com/${secrets.github_pcs_user}"
      insteadOf = "git@github.com:${secrets.github_pcs_user}:"
      insteadOf = "ssh://git@github.com/${secrets.github_pcs_user}/"
    [url "https://${secrets.github_pcs_user}:${secrets.github_pcs_token}@github.com/${secrets.github_pcs_repo}"]
      insteadOf = "https://github.com/${secrets.github_pcs_repo}"
      insteadOf = "git@github.com:${secrets.github_pcs_repo}:"
      insteadOf = "ssh://git@github.com/${secrets.github_pcs_repo}/"
  '';

  # Personal account configuration
  home.file.".gitconfig-lp".text = ''
    [user]
      name = "${secrets.github_lp_user}"
      email = "${secrets.github_lp_email}"
    [url "https://${secrets.github_lp_user}:${secrets.github_lp_token}@github.com/${secrets.github_lp_user}"]
      insteadOf = "https://github.com/${secrets.github_lp_user}"
      insteadOf = "git@github.com:${secrets.github_lp_user}:"
      insteadOf = "ssh://git@github.com/${secrets.github_lp_user}/"
  '';

  # Personal work account configuration
  home.file.".gitconfig-lp-pcs".text = ''
    [user]
      name = "${secrets.github_pcs_user}"
      email = "${secrets.github_pcs_email}"
    [url "https://${secrets.github_pcs_user}:${secrets.github_pcs_token}@github.com/${secrets.github_pcs_user}"]
      insteadOf = "https://github.com/${secrets.github_pcs_user}"
    [url "https://${secrets.github_pcs_user}:${secrets.github_pcs_token}@github.com/${secrets.github_pcs_user}"]
      insteadOf = "https://github.com/${secrets.github_pcs_user}"
      insteadOf = "git@github.com:${secrets.github_pcs_user}:"
      insteadOf = "ssh://git@github.com/${secrets.github_pcs_user}/"
  '';
}
