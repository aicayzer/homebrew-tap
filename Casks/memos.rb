cask "memos" do
  version "0.2.0"
  sha256 "e7f2e15a58d79cb51e1dc02e13ddc7df007829611508b4042d67a4953c4c984a"

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
