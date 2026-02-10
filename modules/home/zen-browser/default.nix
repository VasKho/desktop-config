{ config, lib, pkgs, ... }: let
  extension = uuid: {
    name = uuid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${uuid}/latest.xpi";
      installation_mode = "normal_installed";
      private_browsing = true;
    };
  };
in {
  programs.firefox = {
    enable = true;
    package = pkgs.callPackage ./zen-browser-bin.nix {};

    policies = {
      AppAutoUpdate = false;
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      GenerativeAI = {
        Enabled = false;
      };

      SearchEngines = {
        Default = "DuckDuckGo";
        DefaultPrivate = "DuckDuckGo";
      };

      ExtensionSettings = lib.listToAttrs [
        (extension "uBlock0@raymondhill.net")
        (extension "simple-translate@sienori")
      ];

      Preferences = {
        "browser.shell.checkDefaultBrowser" = true;
        "zen.workspaces.continue-where-left-off" = true;
        "browser.startup.page" = 3;
        "browser.warnOnQuitShortcut" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.override.external" = -1;
        "browser.ctrlTab.sortByRecentlyUsed" =	false;
        "privacy.userContext.enabled" = false;
        "browser.tabs.loadInBackground" = true;
        "browser.display.document_color_use" = 1;
        "browser.preferences.defaultPerformanceSettings.enabled" = true;
        "general.autoScroll" = true;
        "general.smoothScroll" = true;
        "accessibility.tabfocus" = 7;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
        "media.hardwaremediakeys.enabled" = true;
        "zen.urlbar.behavior" = "normal";
        "zen.view.sidebar-expanded" = true;
        "zen.view.use-single-toolbar" = true;
        "browser.tabs.hoverPreview.enabled" = true;
        "zen.tabs.close-on-back-with-no-history" = true;
        "zen.themes.disable-all" = true;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.recentsearches" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "places.history.enabled" = true;
        "browser.formfill.enable" = false;
        "privacy.history.custom" = true;
        "dom.disable_open_during_load" = true;
        "xpinstall.whitelist.required" = true;
        "dom.security.https_only_mode" = true;
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;
        "browser.safebrowsing.downloads.enabled" = true;
        "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = true;
        "browser.safebrowsing.downloads.remote.block_uncommon" = true;
      };
    };

    profiles = {
      vaslch0 = {
        id = 0;
        name = "vaslch0";
        isDefault = true;

        search = {
          default = "ddg";
          privateDefault = "ddg";
        };

        extensions.settings = {
          "uBlock0@raymondhill.net".settings = {
            userSettings = {
              popupPanelSections = 31;
              showIconBadge = false;
            };
          };

          "simple-translate@sienori".settings = {
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
          };
        };
      };
    };
  };
}
