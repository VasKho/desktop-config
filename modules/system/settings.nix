{ ... }:

{
  system = {
    activationScripts.activateSettings.text = ''
      # Following line should allow us to avoid a logout/login cycle
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults.NSGlobalDomain = {
      NSDocumentSaveNewDocumentsToCloud = false;
      InitialKeyRepeat = 30;
      KeyRepeat = 2;
    };

    defaults.dock = {
      autohide = true;
      launchanim = true;
      mineffect = "genie";
      minimize-to-application = true;
      orientation = "bottom";
      show-process-indicators = true;
      show-recents = false;
      tilesize = 59;
      persistent-apps = [
        "/Applications/Zed.app"
        "/Applications/Telegram.app"
      ];
    };

    defaults.ActivityMonitor.ShowCategory = 101;

    defaults.finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      QuitMenuItem = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowPathbar = true;
    };

    defaults.hitoolbox.AppleFnUsageType = "Change Input Source";

    defaults.CustomUserPreferences = {
      "com.apple.spaces" = {
        app-bindings = {
          "ru.keepcoder.telegram" = "AllSpaces";
        };
      };

      "com.apple.AppleMultitouchTrackpad" = {
        TrackpadFourFingerPinchGesture = 2;
        TrackpadFourFingerVertSwipeGesture = 2;
        TrackpadHorizScroll = 1;
        TrackpadMomentumScroll = 1;
        TrackpadPinch = 1;
        TrackpadRightClick = 1;
        TrackpadRotate = 1;
        TrackpadScroll = 1;
        TrackpadThreeFingerHorizSwipeGesture = 2;
      };

      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          "118" = { enabled = 0; };
          "119" = { enabled = 0; };
          "15" = { enabled = 0; };
          "16" = { enabled = 0; };
          "162" = { enabled = 0; };
          "164" = { enabled = 0; };
          "17" = { enabled = 0; };
          "175" = { enabled = 0; };
          "18" = { enabled = 0; };
          "184" = { enabled = 0; };
          "19" = { enabled = 0; };
          "190" = { enabled = 0; };
          "20" = { enabled = 0; };
          "21" = { enabled = 0; };
          "215" = { enabled = 0; };
          "216" = { enabled = 0; };
          "217" = { enabled = 0; };
          "218" = { enabled = 0; };
          "219" = { enabled = 0; };
          "22" = { enabled = 0; };
          "222" = { enabled = 0; };
          "223" = { enabled = 0; };
          "224" = { enabled = 0; };
          "225" = { enabled = 0; };
          "226" = { enabled = 0; };
          "227" = { enabled = 0; };
          "228" = { enabled = 0; };
          "229" = { enabled = 0; };
          "23" = { enabled = 0; };
          "230" = { enabled = 0; };
          "231" = { enabled = 0; };
          "232" = { enabled = 0; };
          "233" = { enabled = 0; };
          "235" = { enabled = 0; };
          "237" = { enabled = 0; };
          "238" = { enabled = 0; };
          "239" = { enabled = 0; };
          "24" = { enabled = 0; };
          "240" = { enabled = 0; };
          "241" = { enabled = 0; };
          "242" = { enabled = 0; };
          "243" = { enabled = 0; };
          "244" = { enabled = 0; };
          "245" = { enabled = 0; };
          "246" = { enabled = 0; };
          "247" = { enabled = 0; };
          "25" = { enabled = 0; };
          "250" = { enabled = 0; };
          "251" = { enabled = 0; };
          "256" = { enabled = 0; };
          "257" = { enabled = 0; };
          "258" = { enabled = 0; };
          "26" = { enabled = 0; };
          "28" = { enabled = 0; };
          "29" = { enabled = 0; };
          "30" = { enabled = 0; };
          "31" = { enabled = 0; };
          "32" = { enabled = 0; };
          "33" = { enabled = 0; };
          "36" = { enabled = 0; };
          "52" = { enabled = 0; };
          "59" = { enabled = 0; };
          "60" = { enabled = 0; };
          "61" = { enabled = 0; };
          "65" = { enabled = 0; };
          "98" = { enabled = 0; };
          "79" = {
            enabled = true;
            value = {
              parameters = [ 65535 123 9437184 ];
              type = "standard";
            };
          };
          "80" = {
            enabled = true;
            value = {
              parameters = [ 65535 123 9568256 ];
              type = "standard";
            };
          };
          "81" = {
            enabled = true;
            value = {
              parameters = [ 65535 124 9437184 ];
              type = "standard";
            };
          };
          "82" = {
            enabled = true;
            value = {
              parameters = [ 65535 124 9568256 ];
              type = "standard";
            };
          };
          "248" = {
            enabled = true;
            value = {
              parameters = [ 65535 123 10223616 ];
              type = "standard";
            };
          };
          "249" = {
            enabled = true;
            value = {
              parameters = [ 65535 124 10223616 ];
              type = "standard";
            };
          };
        };
      };
    };
  };
}
