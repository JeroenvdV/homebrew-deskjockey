cask "deskjockey" do
  version "2.0.0"
  sha256 "435de14840f7e9df0d5bf419cfbbbb469ac56c07ca6b296158ccde9dc851f386"

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
