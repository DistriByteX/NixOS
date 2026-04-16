{ pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        vhostUserPackages = with pkgs; [ virtiofsd ];
        swtpm.enable = true;
      };
    };
    kvmgt.enable = true;
    spiceUSBRedirection.enable = true;
  };
  programs.virt-manager.enable = true;
}
