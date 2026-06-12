cask "recall" do
  version "1.1.1"
  sha256 "ee4700db1bf38e479c3d156ec19ad0bb38ac30c759592489f86bb8ddfc90022f"

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
