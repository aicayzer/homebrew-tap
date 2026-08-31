class Sessionmail < Formula
  desc "Local, paired mailbox for AI coding agents that can't otherwise reach each other"
  homepage "https://github.com/aicayzer/sessionmail"
  url "https://registry.npmjs.org/sessionmail/-/sessionmail-0.2.1.tgz"
  sha256 "d364bd5d5b7650b9a05d4d85ca15f5fa0d2f31e0ad50fb755012545bd43f65c8"
  license "MIT"
  head "https://github.com/aicayzer/sessionmail.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/sessionmail --version")
  end
end
