class Cookiy < Formula
  desc "One-command setup for Cookiy MCP server in your AI coding clients"
  homepage "https://cookiy.ai"
  version "1.7.7"

  on_arm do
    url "https://github.com/cookiy-ai/homebrew-tap/releases/download/cookiy-v1.7.7/cookiy-v1.7.7-darwin-arm64.tar.gz"
    sha256 "a041c41058ffe3c9172f34464c7cf10c6d1f6b04c5e0a11c0cb2e1e99b508097"
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

      To re-run production setup later, run:
        cookiy -y

      For advanced non-production or custom targets, run:
        cookiy --help
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cookiy --version").strip
  end
end
