class Sessionmail < Formula
  desc "Local, paired mailbox for AI coding agents that can't otherwise reach each other"
  homepage "https://github.com/aicayzer/sessionmail"
  url "https://registry.npmjs.org/sessionmail/-/sessionmail-0.2.0.tgz"
  sha256 "d8ff00dfdb977e50d05c68b378c63a2737961a787548d13f185784d19d17e248"
  license "MIT"
  head "https://github.com/aicayzer/sessionmail.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/sessionmail --version")
  end
end
