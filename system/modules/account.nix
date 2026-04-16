{ pkgs, ... }:

{
  users.users.distribytex = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" "kvm" ];
  };
  programs.bash = {
    completion.enable = true;
    completion.package = pkgs.bash-completion;
    interactiveShellInit = ''eval "$(starship init bash)"'';
    shellAliases = {
      update-repo = "sudo nix flake update --flake /etc/nixos";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#DistriByteX-PC";
      upgrade = "sudo nixos-rebuild switch --flake /etc/nixos#DistriByteX-PC --upgrade";
      rebuild-boot = "sudo nixos-rebuild boot --flake /etc/nixos#DistriByteX-PC";
      remove-garbage = "sudo nix-collect-garbage -d";
    };
  };
}
