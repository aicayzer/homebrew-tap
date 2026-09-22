cask "memos" do
  version "0.3.1"
  sha256 "e97e6ddb785b19aacc603ed5bad94d527fc548cc564af3fe8a48a4c2d78ddd7d"

  url "https://github.com/aicayzer/memos/releases/download/v#{version}/Memos-#{version}.dmg"
  name "Memos"
  desc "Small native notes window that floats above whatever you are doing"
  homepage "https://github.com/aicayzer/memos"

  # The app updates itself through Sparkle, so brew need not.
  auto_updates true
  depends_on macos: :tahoe

  app "Memos.app"
  # The command line tool ships inside the app and reads the same store.
  binary "#{appdir}/Memos.app/Contents/SharedSupport/bin/memos"

  zap trash: "~/Library/Containers/me.cyzr.memos"
end
