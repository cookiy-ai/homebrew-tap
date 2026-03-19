class Cookiy < Formula
  desc "One-command bootstrap for Cookiy local skills and MCP in your AI coding clients"
  homepage "https://cookiy.ai"
  version "1.7.11"

  on_arm do
    url "https://github.com/cookiy-ai/homebrew-tap/releases/download/cookiy-v1.7.11/cookiy-v1.7.11-darwin-arm64.tar.gz"
    sha256 "4710348be0340029fa8f46bb58cfba27e0afdf7c8a8f83584eb0dc8c5e0e5808"
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
