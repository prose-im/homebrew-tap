cask "prose" do
  version "0.6.1"

  arch arm: "aarch64", intel: "x86_64"
  arch_short = on_arch_conditional arm: "aarch64", intel: "x64"
  platform = "macos"

  sha256 arm:   "9c51efe805664368eb0ce8ec537dedd7e77a07fece2396cc501a763248054b4c",
         intel: "aa22e4771ffa05c5c47c37a635161ccbbf5ee71c21b497cd5289944f12713054"

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
