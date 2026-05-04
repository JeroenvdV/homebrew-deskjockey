cask "deskjockey" do
  version "1.1.0"
  sha256 "1b350813722f18e605dd33d895cd9873b2838df4d8546f5026542005359274c8"

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
