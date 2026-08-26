class Sessionmail < Formula
  desc "Local, paired mailbox for AI coding agents that can't otherwise reach each other"
  homepage "https://github.com/aicayzer/sessionmail"
  url "https://registry.npmjs.org/sessionmail/-/sessionmail-0.1.0.tgz"
  sha256 "09c221eabbf63d4b1cca2b31d4f8fe99fa031901e20c6e3d382f29036f3b0b4c"
  license "MIT"
  head "https://github.com/aicayzer/sessionmail.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/sessionmail --version")
  end
end
