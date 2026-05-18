{ lib, ... }:
{
  programs.hyprland.enable = true;

  home-manager.users.benjamin = {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      settings = {
        monitor = {
          output = "desc:LG Electronics LG ULTRAGEAR 204MARZEG878";
          vrr = 1;
          bitdepth = 10;
          cm = "hdr";
        };
        bind = [
          # Apps
          {
            _args = [
              "SUPER + RETURN"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")
            ];
          }
          {
            _args = [
              "SUPER + E"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty -e yazi\")")
            ];
          }
          {
            _args = [
              "SUPER + SPACE"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"rofi -show drun\")")
            ];
          }
          {
            _args = [
              "SUPER + B"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"zen\")")
            ];
          }

          # Controlls
          {
            _args = [
              "SUPER + ESCAPE"
              (lib.generators.mkLuaInline "hl.dsp.window.close(activewindow)")
            ];
          }
          {
            _args = [
              "SUPER + ALT + 4"
              (lib.generators.mkLuaInline "hl.dsp.window.kill(activewindow)")
            ];
          }
          {
            _args = [
              "SUPER + F"
              (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({\"fullscreen\", toggle, activewindow})")
            ];
          }
          {
            _args = [
              "SUPER + D"
              (lib.generators.mkLuaInline "hl.dsp.window.float({toggle, activewindow})")
            ];
          }
          {
            _args = [
              "SUPER + BACKSLASH"
              (lib.generators.mkLuaInline "hl.dsp.layout(\"togglesplit\")")
            ];
          }
          #groups missing
          {
            _args = [
              "SUPER + H"
              (lib.generators.mkLuaInline "hl.dsp.focus(l)")
            ];
          }
          {
            _args = [
              "SUPER + J"
              (lib.generators.mkLuaInline "hl.dsp.focus(d)")
            ];
          }
          {
            _args = [
              "SUPER + K"
              (lib.generators.mkLuaInline "hl.dsp.focus(u)")
            ];
          }
          {
            _args = [
              "SUPER + L"
              (lib.generators.mkLuaInline "hl.dsp.focus(r)")
            ];
          }
          {
            _args = [
              "SUPER + SHIFT + H"
              (lib.generators.mkLuaInline "hl.dsp.window.swap(l)")
            ];
          }
          {
            _args = [
              "SUPER + SHIFT + J"
              (lib.generators.mkLuaInline "hl.dsp.window.swap(d)")
            ];
          }
          {
            _args = [
              "SUPER + SHIFT + K"
              (lib.generators.mkLuaInline "hl.dsp.window.swap(u)")
            ];
          }
          {
            _args = [
              "SUPER + SHIFT + L"
              (lib.generators.mkLuaInline "hl.dsp.window.swap(r)")
            ];
          }
          {
            _args = [
              "SUPER + ALT + H"
              (lib.generators.mkLuaInline "hl.dsp.window.rezize(r)")
            ];
          }
          {
            _args = [
              "SUPER + SHIFT + B"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"zen\")")
            ];
          }
        ];
      };
    };
  };
}
