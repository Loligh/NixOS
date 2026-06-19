{ ... }:
{

  services.logind = {
    enable = true;
    settings.Login = {
      HandlePowerKey = "suspend";
      HandlePowerKeyLongPress = "shutdown";
      HandleSuspendKey = "suspend";
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
