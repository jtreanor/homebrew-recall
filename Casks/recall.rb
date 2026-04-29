cask "recall" do
  version "1.0.0"
  sha256 "e61f19cacde1e4c3f9206837c267825636756c2134c236b840ce7aa6c93e43e5"

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
