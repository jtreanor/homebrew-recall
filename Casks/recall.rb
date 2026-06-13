cask "recall" do
  version "1.1.2"
  sha256 "b28b4c6c72becf6563d9e3d2d29a8a73c28e53245fe733d116abea5beb60f181"

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
