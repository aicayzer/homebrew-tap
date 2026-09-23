cask "memos" do
  version "0.3.2"
  sha256 "46c400258bfc5ce20bcf6feb8aaf8b85b7d37f0757055d9cdc5a710319a143f0"

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
