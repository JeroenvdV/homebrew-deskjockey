cask "deskjockey" do
  version "1.2.0"
  sha256 "d1cde0e240808472415c8dea216699fa160083534757decd889b4f54170ba582"

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
