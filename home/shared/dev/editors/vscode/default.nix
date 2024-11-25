{pkgs, ...}: {
  home.packages = with pkgs; [
    (vscode.override {
      commandLineArgs = [
        "--user-data-dir ~/Code"
        "--extensions-dir ~/Code/Extensions"
      ];
    })
  ];
}
