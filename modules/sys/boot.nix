{ inputs, lib, ... }:
{
  sys.boot.provides = {
    desktop = {
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
    pi = {
      nixos = {
        boot =
	{
	  supportedFilesystems.zfs = lib.mkForce false;
	  initrd =
	  {
	    availableKernelModules =
	    {
              # other modules go here

              # todo: remove this when this is fixed: https://github.com/NixOS/nixpkgs/issues/154163
              # related: https://github.com/NixOS/nixpkgs/issues/109280
              # related: https://discourse.nixos.org/t/cannot-build-raspberry-pi-sdimage-module-dw-hdmi-not-found/71804
              dw-hdmi = lib.mkForce false;
              dw-mipi-dsi = lib.mkForce false;
              rockchipdrm = lib.mkForce false;
              rockchip-rga = lib.mkForce false;
              phy-rockchip-pcie = lib.mkForce false;
              pcie-rockchip-host = lib.mkForce false;
              pwm-sun4i = lib.mkForce false;
              sun4i-drm = lib.mkForce false;
              sun8i-mixer = lib.mkForce false;
            };
	  };
	};
	sdImage.compressImage = false;
	hardware.raspberry-pi.firmware.uboot.enable = true;
      };
    };
  };
}
