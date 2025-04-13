cask "prose" do
  version "0.8.2"

  arch arm: "aarch64", intel: "x86_64"
  arch_short = on_arch_conditional arm: "aarch64", intel: "x64"
  platform = "macos"

  sha256 arm:   "ecbaed04e2171dd857875b9a34523dd6868511d0f48018e6d340ffeb9ce8b5b2",
         intel: "82acfc25a02cf5cc218bbd4d81f3901b3f7dd2d50058ccdfc270d6c153e75a05"

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
