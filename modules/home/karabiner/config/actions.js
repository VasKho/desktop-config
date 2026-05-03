const gen = new (require("./generator.js"))();

toggleMessengerCommand = `osascript -e '
if application "Telegram" is not running
  do shell script "open -a Telegram"
end if

tell application "System Events"
  tell process "Telegram"
    set state to get value of attribute "AXMinimized" of first window
    set value of attribute "AXMinimized" of first window to not state
    if state is true
      set frontmost to true
    end if
  end tell
end tell'`;

module.exports = gen.build({
  description: "System-wide shortcut actions",
  binds: [
    {
      from: { code: "s", mMods: ["left_command", "right_command"] },
      to: [gen.runSh("open -a Screenshot")],
    },
    {
      from: { code: "return_or_enter", mMods: ["command"] },
      to: [gen.runSh("open -na Ghostty")],
    },
    {
      from: { code: "m", mMods: ["command"] },
      to: [gen.runSh(toggleMessengerCommand)],
    },
  ],
});
