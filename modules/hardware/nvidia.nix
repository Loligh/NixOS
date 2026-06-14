{ ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  home-manager.users.benjamin = {
    wayland.windowManager.hyprland = {
      settings = {
        env = [
          {
            _args = [
              "LIBVA_DRIVER_NAME"
              "nvidia"
            ];
          }
          {
            _args = [
              "__GLX_VENDOR_LIBRARY_NAME"
              "nvidia"
            ];
          }
        ];
      };
    };
  };
}
