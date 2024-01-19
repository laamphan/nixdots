{ pkgs, ... }: {
  home.packages = with pkgs; [
    google-cloud-sdk
    google-cloud-sql-proxy
    kubectl
    kubernetes-helm
    kind
  ];
}
