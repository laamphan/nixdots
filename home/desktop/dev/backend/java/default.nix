{pkgs, ...}: {
  home.packages = with pkgs; [
    jdk17 # Java dev kit
    # maven # Build automation tool for java
    # spring-boot-cli
  ];
}
