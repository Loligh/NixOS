{ ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
