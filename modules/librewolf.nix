{ lib, ... }: let
  extension = uuid: {
    name = uuid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${uuid}/latest.xpi";
      installation_mode = "normal_installed";
      private_browsing = true;
    };
  };
in {
  programs.librewolf = {
    enable = true;

    policies = {
      AppAutoUpdate = false;
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      GenerativeAI.Enabled = false;

      ExtensionSettings = lib.listToAttrs [
        (extension "uBlock0@raymondhill.net")
        (extension "simple-translate@sienori")
        (extension "jid1-MnnxcxisBPnSXQ@jetpack")
        (extension "{7e79d10d-9667-4d38-838d-471281c568c3}")
      ];
    };

    profiles.default = {
      id = 0;
      isDefault = true;

      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
      };

      settings = {
        "accessibility.tabfocus" = 7;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.contentblocking.category" = "strict";
        "browser.ctrlTab.sortByRecentlyUsed" = false;
        "browser.display.document_color_use" = 1;
        "browser.formfill.enable" = false;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.override.external" = -1;
        "browser.preferences.defaultPerformanceSettings.enabled" = true;
        "browser.safebrowsing.downloads.enabled" = true;
        "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = true;
        "browser.safebrowsing.downloads.remote.block_uncommon" = true;
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;
        "browser.search.suggest.enabled" = false;
        "browser.shell.checkDefaultBrowser" = true;
        "browser.startup.page" = 3;
        "browser.tabs.hoverPreview.enabled" = true;
        "browser.tabs.loadInBackground" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.translations.neverTranslateLanguages" = "ru";
        "browser.urlbar.suggest.recentsearches" = true;
        "browser.warnOnQuitShortcut" = true;
        "dom.disable_open_during_load" = true;
        "dom.security.https_only_mode" = true;
        "extensions.autoDisableScopes" = 0;
        "general.autoScroll" = true;
        "general.smoothScroll" = true;
        "media.hardwaremediakeys.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
        "places.history.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.history.custom" = true;
        "privacy.userContext.enabled" = false;
        "sidebar.new-sidebar.has-used" = true;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "xpinstall.whitelist.required" = true;
      };

      extensions.force = true;
      extensions.settings = {
        "uBlock0@raymondhill.net".settings = {
          popupPanelSections = 31;
          showIconBadge = false;
        };

        "simple-translate@sienori".settings = {
          "Settings" = {
            translationApi = "google";
            targetLang = "ru";
            secondTargetLang = "zh-CN";
            ifShowCandidate = true;
            whenSelectText = "showButton";
            ifCheckLang = true;
            ifChangeSecondLang = true;
            ifShowMenu = true;
            pageTranslationOpenTo = "newTab";
            theme = "system";
            buttonSize = 22;
            buttonDirection = "bottomRight";
            buttonOffset = 10;
            panelReferencePoint = "bottomSelectedText";
            panelDirection = "bottom";
            waitTime = 150;
            isShowOptionsPageWhenUpdated = false;
            isDebugMode = false;
            initedShortcuts = [
              "_execute_action"
              "translateSelectedText"
              "translatePage"
            ];
          };
        };
        "{7e79d10d-9667-4d38-838d-471281c568c3}".settings = {
          state = builtins.toJSON {
            expressions = [
              {
                expression = "addons.mozilla.org*";
                id = "ByLx0b8IGe";
                regExp = "^addons\\.mozilla\\.org.*$";
              }
              {
                expression = "chat.deepseek.com*";
                id = "HJAR6-U8Mg";
                regExp = "^chat\\.deepseek\\.com.*$";
              }
              {
                expression = "search.nixos.org*";
                id = "SJKaaZUIfl";
                regExp = "^search\\.nixos\\.org.*$";
              }
            ];
            historyDeletedCounterTotal = 0;
            settings = {
              keepHistory = { name = "keepHistory"; value = false; id = 1; };
              daysToKeep = { name = "daysToKeep"; value = 60; id = 2; };
              statLogging = { name = "statLogging"; id = "B1GKVGU8fe"; value = false; };
              showVisitsInIcon = { name = "showVisitsInIcon"; value = false; id = 4; };
            };
          };
        };
      };
    };
  };
}
