{
  sys.boot = {
    nixos.boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
      systemd-boot.enable = false;
    };
  };
}
