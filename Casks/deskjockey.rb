cask "deskjockey" do
  version "1.0.0"
  sha256 "9366df4d83b96c8fde53d69a357641d1ac5dca2fa8d31634a1b81447e674afbf"

  url "https://github.com/JeroenvdV/Deskjockey/releases/download/v#{version}/Deskjockey.zip"
  name "Deskjockey"
  desc "Menu bar app that saves and restores multi-monitor display arrangements"
  homepage "https://github.com/JeroenvdV/Deskjockey"

  depends_on macos: ">= :ventura"

  app "Deskjockey.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Deskjockey.app"]
  end

  zap trash: [
    "~/Library/Application Support/Deskjockey",
    "~/Library/Logs/Deskjockey",
  ]
end
