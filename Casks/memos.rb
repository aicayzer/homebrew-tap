cask "memos" do
  version "0.4.0"
  sha256 "8681efd419b5c9950803b87411ba2be03bc30cc127eaa8161e2b580d486c4965"

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
