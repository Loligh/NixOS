{ ... }:
{
  home-manager.users.benjamin = {
    programs.vesktop = {
      enable = true;

      #https://github.com/Vencord/Vesktop/blob/main/src/shared/settings.d.ts
      settings = {
        discordBranch = "stable";
        transparancyOption = "acrylic";
        tray = false;
        minimizeToTray = false;
        autoStartMinimized = false;
        openLinksWithElectron = false;
        staticTitle = true;
        enableMenu = false;
        disableSmoothScroll = false;
        hardwareAcceleration = true;
        hardwareVideoAcceleration = true;
        arRPC = true;
        appBadge = false;
        enableTaskbarFlashing = false;
        disableMinSize = false;
        clickTrayShowHide = false;
        customTitleBar = false;

        enableSplashScreen = false;

        spellCheckLanguages = [
          "en-US"
          "en"
          "de-DE"
          "de"
        ];
      };
      vencord = {
        useSystem = true;

        #https://github.com/Vendicated/Vencord/blob/main/src/api/Settings.ts
        settings = {
          autoUpdate = false;
          autoUpdateNotification = false;
          useQuickCss = false;
          eagerPatches = false;
          enabledThemes = [ ];
          enableReactDetools = false;
          themeLinks = [ ];
          frameless = false;
          transparent = false;
          winCtrlQ = false;
          disableMinSize = false;
          winNativeTitleBar = false;

          plugins = {
            AccountPanelServerProfile.enabled = true;
            AlwaysExpandRoles.enabled = true;
            AlwaysTrust.enabled.enabled = true;
            AnonymiseFileNames.enabled = true;
            AutoDNDWhilePlaying.enabled = true; # not available in Vesktop
            BetterGifPicker.enabled = true;
            ClearURLs.enabled = true;
            CopyFileContents.enabled = true;
            Decor.enabled = true;
            DisableCallIdle.enabled = true;
            DisableDeepLinks.enabled = true;
            FakeNitro.enabled = true;
            FakeProfileThemes.enabled = true;
            FavoriteGifSearch.enabled = true;
            FixImagesQuality.enabled = true;
            ForceOwnerCrown.enabled = true;
            FriendsSince.enabled = true;
            FullSearchContext.enabled = true;
            GifPaste.enabled = true;
            GreetStickerPicker.enabled = true;
            IgnoreActivities.enabled = true;
            ImplicitRelationships.enabled = true;
            MentionAvatars.enabled = true;
            MessageLinkEmbeds.enabled = true;
            MessageLogger.enabled = true;
            NewGuildSettings.enabled = true;
            NoMosaic.enabled = true;
            NoTrack.enabled = true;
            OpenInApp.enabled = true;
            PermissionFreeWill.enabled = true;
            PermissionsViewer.enabled = true;
            SendTimestamps.enabled = true;
            ServerInfo.enabled = true;
            Settings.enabled = true;
            ShowHiddenChannels.enabled = true;
            ShowHiddenThings.enabled = true;
            SilentMessageToggle.enabled = true;
            StreamerModeOnStream.enabled = true;
            Summaries.enabled = true;
            TypingIndicator.enabled = true;
            TypingTweaks.enabled = true;
            USRBG.enabled = true;
            VoiceMessages.enabled = true;
            VolumeBooster.enabled = true;
            WebContextMenus.enabled = true;
            WebKeybinds.enabled = true;
            WebRichPresence.enabled = true; # not available in Vesktop
            WebScreenShareFixes.enabled = true;
            WhoReacted.enabled = true;
            YoutubeAdblock.enabled = true;
          };
        };
      };
    };
  };
}
