{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module
    open = false;

    nvidiaSettings = true;

    package = config.hardware.nvidia.stable;
  };

  environment.systemPackages = with pkgs; [
    nvidia-offload
  ];
}
