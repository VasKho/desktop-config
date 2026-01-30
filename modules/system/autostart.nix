{ config, lib, ... }:

{
  system.activationScripts.loginItems.text = ''
    osascript -e 'tell application "System Events" to if exists login item "Raycast" then delete login item "Raycast"'
    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Nix Apps/Raycast.app/", hidden:false}'
'';
}
