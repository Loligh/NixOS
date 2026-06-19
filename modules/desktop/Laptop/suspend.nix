{ ... }:
{

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HdnlePowerKey = "suspend";
  };
}
