cask "prose" do
  version "0.8.0"

  arch arm: "aarch64", intel: "x86_64"
  arch_short = on_arch_conditional arm: "aarch64", intel: "x64"
  platform = "macos"

  sha256 arm:   "fd8315014fb10ed6d82cba4e3aded8f4fba478862df771e3385b1ffdeef4168d",
         intel: "361d0b7ff5942fea8a55485df443e18646b89d7faf5c11b8199cb6d2a204936c"

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
