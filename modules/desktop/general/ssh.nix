{
  self,
  inputs,
  config,
  ...
}:
{
  programs.ssh = {
    extraConfig = ''
      Host work.github.com
        HostName ssh.github.com
        Port 443
        User git
        IdentityFile ${config.age.secrets."ssh/work/id".path}
    '';
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    "ssh/work/id" = {
      file = self + /secrets/desktop/general/ssh/work/id_ed25519.age;
      owner = "benjamin";
    };
  };
}
