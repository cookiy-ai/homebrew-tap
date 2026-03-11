class Cookiy < Formula
  desc "One-command setup for Cookiy MCP server in your AI coding clients"
  homepage "https://cookiy.ai"
  version "1.7.5"

  on_arm do
    url "https://raw.githubusercontent.com/cookiy-ai/homebrew-tap/main/Artifacts/cookiy-v1.7.5-darwin-arm64.tar.xz"
    sha256 "6fbe28350fd0dea3444e616fa926f92a029e6cfb51c4aa53a9c522104d291990"
  end

  on_intel do
    odie "cookiy currently publishes only an Apple Silicon macOS binary. Use the npm package on Intel Macs for now."
  end

  def install
    bin.install "cookiy"
  end

  def post_install
    system bin/"cookiy", "-y"
  end

  def caveats
    <<~EOS
      The Homebrew install auto-configured Cookiy MCP for the default production environment.

      To switch environments later, run:
        cookiy dev -y
        cookiy preview -y
        cookiy staging -y
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cookiy --version").strip
  end
end
