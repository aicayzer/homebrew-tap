class Runpool < Formula
  desc "On-demand self-hosted GitHub Actions runner pools for macOS"
  homepage "https://github.com/aicayzer/runpool"
  url "https://github.com/aicayzer/runpool/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7580b8b699646618410d31ff26f56c7fa2aa80056252be12abecae9e0a96ffa5"
  license "MIT"
  head "https://github.com/aicayzer/runpool.git", branch: "main"

  # The GitHub CLI does every API call and supplies authentication, so there is
  # no token handling in runpool itself.
  depends_on "gh"

  # launchd, sysctl, ~/Library paths and the osx-arm64 runner build. Linux and
  # Windows are already well served by existing autoscalers.
  depends_on :macos

  def install
    # The executable resolves its own location, following symlinks, to find lib/
    # next to itself. Keeping bin/ and lib/ together under libexec preserves
    # that; installing the script straight into bin would put lib/ one level
    # too high.
    libexec.install "bin", "lib", "contrib", "runpool.conf.example"
    bin.install_symlink libexec/"bin/runpool"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Configuration lives outside the formula, at:
        #{Dir.home}/.config/runpool/config

      Start from the shipped example:
        cp #{opt_libexec}/runpool.conf.example ~/.config/runpool/config

      Then authenticate the GitHub CLI, register a pool, and install the
      background agents that make pools on-demand:
        gh auth login
        runpool register <pool> --repo OWNER/REPO   # or --org ORG
        runpool schedule install

      Nothing starts at login. Pools come up when jobs queue and stand down
      when idle.
    EOS
  end

  test do
    assert_match "runpool", shell_output("#{bin}/runpool --help")
    # With no pools registered, status must still succeed and emit valid JSON
    # rather than failing on an empty install.
    output = shell_output("RUNPOOL_BASE=#{testpath}/data #{bin}/runpool status --json")
    assert_match "\"pools\":[]", output
  end
end
