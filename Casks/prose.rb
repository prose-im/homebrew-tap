cask "prose" do
  version "0.13.1"

  arch arm: "aarch64", intel: "x86_64"
  arch_short = on_arch_conditional arm: "aarch64", intel: "x64"
  platform = "macos"

  sha256 arm:   "a5c2423f28dca316da556e0f9ab6f82bf906dd76d0e48b62f0eff39416d02537",
         intel: "9024f9b7c5127aad7675ec3549c7534b931c44aa30496bb18cb9d882ab551511"

  url "https://files.prose.org/apps/versions/#{version}/#{platform}/#{arch}/Prose_#{version}_#{arch_short}.dmg"
  name "Prose"
  name "Prose IM App"
  desc "XMPP client for team messaging"
  homepage "https://prose.org"

  livecheck do
    url "https://files.prose.org/apps/updates/latest.json"
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
