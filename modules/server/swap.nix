{ ... }:
{
  swapDevices = [
    {
      device = "/swapfile";
      size = 6 * 1024; # 6 GiB
    }
  ];
}
