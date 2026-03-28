class Cookiy < Formula
  desc "One-command bootstrap for Cookiy local skills and MCP in your AI coding clients"
  homepage "https://cookiy.ai"
  version "1.7.19"

  on_arm do
    url "https://raw.githubusercontent.com/cookiy-ai/homebrew-tap/main/Artifacts/cookiy-v1.7.19-darwin-arm64.tar.gz"
    sha256 "d6d23b574f8a8326f3254c4a64587533bb10f71074430947840650fdb6e21366"
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
      The Homebrew install ran the Cookiy bootstrap flow for the default production environment.

      On supported clients, Cookiy installs a local skill copy first and then configures MCP.
      On other clients, it falls back to MCP-only setup.

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
