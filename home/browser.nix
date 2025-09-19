# Browser Configuration

# Zen Browser: Primary browser
# Plugins: 
#   - uBlock Origin
#   - returnyoutubedislike
#   - marxmode
#   - Youtube Unhook
#
# Other browsers:
#   - Chromium (just for testing compatibility)
#   - Firefox  (just for testing Gecko compatibility)
#   - Mulvad   (for secure browsing)

{ pkgs, ... } :

{
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        # TODO: confirm extension IDs and preferred install URLs for the following
        # returnyoutubedislike
        # "return-youtube-dislike@developer" = { ... };

        # marxmode (confirm id)
        # "marxmode@..." = { ... };

        # Youtube Unhook (confirm id)
        # "youtube-unhook@..." = { ... };
      };
    };
  };
}