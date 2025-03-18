cask "prose" do
  version "0.6.0"

  arch arm: "aarch64", intel: "x86_64"
  arch_short = on_arch_conditional arm: "aarch64", intel: "x64"
  platform = "macos"

  sha256 arm:   "731c1432e512d28f7933a94d75a02e57e64b77b7388dff9170d418857a7807aa",
         intel: "d1c8f2e96ce038ed6c55374ddb253b13488b6b03f8a0786a787e9e11af26e738"

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
