cask "prose" do
  version "0.5.4"

  arch arm: "aarch64", intel: "x86_64"
  arch_short = on_arch_conditional arm: "aarch64", intel: "x64"

  sha256 arm:   "c000b3c1d0a5d3af3e9e61678c18c5acd119ea5bb77edbafe51d982ab1d7d2d5"
         intel: "807dc92cd574da2d153850004e030bcbbc5dfaf1d537583f237afda822292eb8"

  url "https://files.prose.org/apps/versions/#{version}/#{platform}/#{arch}/Prose_#{version}_#{arch_short}.dmg"
  name "Prose"
  name "Prose IM App"
  desc "XMPP client for team messaging"
  homepage "https://prose.org"

  livecheck do
    url "https://raw.githubusercontent.com/prose-im/prose-app-web/refs/heads/master/package.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :ventura"

  app "Prose.app"

  zap trash: [
    "~/Library/Caches/org.prose.app-web",
    "~/Library/Logs/org.prose.app-web",
    "~/Library/Preferences/org.prose.app-web.plist",
    "~/Library/WebKit/org.prose.app-web",
  ]
end
