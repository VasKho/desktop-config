{ config, lib, pkgs, inputs, ... }: let
  extension = uuid: {
    name = uuid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${uuid}/latest.xpi";
      installation_mode = "normal_installed";
      private_browsing = true;
    };
  };
in {
  home.sessionVariables.MOZ_LEGACY_PROFILES = 1;
  programs.zen-browser = {
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
        "xpinstall.whitelist.required" = true;
        "zen.welcome-screen.seen" = true;
        "zen.workspaces.continue-where-left-off" = true;
        "zen.urlbar.behavior" = "float";
        "zen.view.sidebar-expanded" = true;
        "zen.view.use-single-toolbar" = false;
        "zen.tabs.close-on-back-with-no-history" = true;
        "zen.themes.disable-all" = true;
      };

      keyboardShortcutsVersion = 16;
      keyboardShortcuts = [
        {
          id = "key_newNavigatorTab";
          key = "t";
          modifiers.control = true;
        }
        {
          id = "key_restoreLastClosedTabOrWindowOrSession";
          key = "t";
          modifiers.control = true;
          modifiers.shift = true;
        }
        {
          id = "key_reload";
          key = "r";
          modifiers.control = true;
        }
        {
          id = "key_reload_skip_cache";
          key = "r";
          modifiers.control = true;
          modifiers.shift = true;
        }
        {
          id = "key_privatebrowsing";
          key = "p";
          modifiers.control = true;
          modifiers.shift = true;
        }
        {
          id = "focusURLBar";
          key = "l";
          modifiers.control = true;
        }
      ];


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
      };
    };
  };
}
