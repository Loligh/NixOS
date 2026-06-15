{ ... }:
{
  programs.hyprland.enable = true;

  home-manager.users.benjamin = {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      settings = {
        monitor = {
          output = "desc:LG Electronics LG ULTRAGEAR 204MARZEG878";
          mode = "highres";
          vrr = 1;
          bitdepth = 8;
        };
        device = {
          name = "chicony-acer-tablet-keyboard";

        };
        config = {
          general = {
            border_size = 0;
            gaps_in = 7;
            gaps_out = 12;
            float_gaps = 0;
            gaps_workspaces = 0;
            col.inactive_border = "0xff444444";
            col.active_border = "0xffffffff";
            col.nogroup_border = "0xffffaaff";
            col.nogroup_border_active = "0xffff00ff";
            layout = "dwindle";
            no_focus_fallback = true;
            allow_tearing = false;
          };
          decoration = {
            rounding = 25;
            rounding_power = 2.0;
            active_opacity = 0.95;
            inactive_opacity = 0.86;
            fullscreen_opacity = 1.0;
            dim_inactive = false;
            dim_strength = 0.5;
            dim_special = 0.7;
            dim_around = 0.7;
            screen_shader = "";
            border_part_of_window = true;
            blur = {
              enabled = true;
              size = 2;
              passes = 3;
              ignore_opacity = true;
              new_optimizations = true;
              xray = false;
              noise = 0.0117;
              contrast = 0.8916;
              brightness = 0.8172;
              vibrancy = 0.1696;
              vibrancy_darkness = 0.0;
              special = true;
              popups = false;
            };
            shadow = {
              enabled = true;
              range = 9;
              render_power = 1;
              sharp = false;
              #offset = "0. 43";
            };
            glow = {
              enabled = true;
              range = 10;
              render_power = 3;
              color = "0xee1a1a1a";
            };
            motion_blur = {
              enabled = false;
              samples = 7;
            };
          };
          animations = {
            enabled = true;
            workspace_wraparound = false;
          };
          input = {
            repeat_rate = 25;
            repeat_delay = 600;
            sensitivity = 0.0;
            accel_profile = "flat";
            touchpad = {
              disable_while_typing = true;
              natural_scroll = true;
              scroll_factor = 1.0;
              middle_button_emulation = false;
            };
          };
          gesture = {
            fingers = 3;
            direction = "horizontal";
            action = "workspace";
          };
        };
      };
      extraConfig = ''
        hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("ghostty"))
        hl.bind("SUPER + E", hl.dsp.exec_cmd("ghostty -e yazi"))
        hl.bind("SUPER + B", hl.dsp.exec_cmd("zen"))
        hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun"))

        hl.bind("SUPER + ESCAPE", hl.dsp.window.close(activewindow))
        hl.bind("SUPER + ALT + 4", hl.dsp.window.kill(activewindow))
        hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = toggle }))
        hl.bind("SUPER + D", hl.dsp.window.float({ mode = "fullscreen", action = toggle }))
        hl.bind("SUPER + BACKSLASH", hl.dsp.layout("togglesplit"))

        hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
        hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

        hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
        hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
        hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
        hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

        hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
        hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))
        hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
        hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))

        hl.bind("SUPER + ALT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
        hl.bind("SUPER + ALT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
        hl.bind("SUPER + ALT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
        hl.bind("SUPER + ALT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })

        hl.workspace_rule({ workspace = "1", persistent = true })
        hl.workspace_rule({ workspace = "2", persistent = true })
        hl.workspace_rule({ workspace = "3", persistent = true })

        hl.bind("SUPER + I", hl.dsp.focus({ workspace = 1 }))
        hl.bind("SUPER + O", hl.dsp.focus({ workspace = 2 }))
        hl.bind("SUPER + P", hl.dsp.focus({ workspace = 3 }))

        hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "1", follow = true }))
        hl.bind("SUPER + SHIFT + O", hl.dsp.window.move({ workspace = "2", follow = true }))
        hl.bind("SUPER + SHIFT + P", hl.dsp.window.move({ workspace = "3", follow = true }))

        hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "1", follow = false }))
        hl.bind("SUPER + SHIFT + O", hl.dsp.window.move({ workspace = "2", follow = false }))
        hl.bind("SUPER + SHIFT + P", hl.dsp.window.move({ workspace = "3", follow = false }))

        hl.workspace_rule({ workspace = "special:music", gaps_out = 100, no_border = true, persistent = false, on_created_empty = "ghostty"})
        hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("special:music"))
      '';
    };
  };
}
