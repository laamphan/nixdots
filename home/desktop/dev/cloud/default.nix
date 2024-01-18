{ pkgs, ... }: {
  home.packages = with pkgs; [
    google-cloud-sdk
    kubectl
    kubernetes-helm
  ];
}
