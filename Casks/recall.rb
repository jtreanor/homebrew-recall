cask "recall" do
  version "1.1.0"
  sha256 "8921f6c4b7855615851c0daedc29ab75e07ce529b9ed4568a2c09116946cc4fb"

  url "https://github.com/jtreanor/recall/releases/download/v#{version}/Recall-#{version}.dmg"
  name "Recall"
  desc "Keyboard-first clipboard history manager for macOS"
  homepage "https://github.com/jtreanor/recall"

  app "Recall.app"

  # Recall is ad-hoc signed but not yet notarized. Remove the quarantine
  # xattr so Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Recall.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Recall",
    "~/Library/Preferences/com.jtreanor.Recall.plist",
  ]
end
