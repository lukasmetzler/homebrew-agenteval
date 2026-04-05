class Agenteval < Formula
  desc "Lint, benchmark, and CI gate for AI coding instructions"
  homepage "https://github.com/lukasmetzler/agenteval"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-arm64"
      sha256 "ce9f312070427b629f8ae15e7a5796bb4c44823e1e3e0095ab09ec9104948458"
    else
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-x64"
      sha256 "53a6d0f057c8a2a432d233c1f74c8c4c16d18347d1008758f04a0052a75b2b99"
    end
  end

  on_linux do
    url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-linux-x64"
    sha256 "62d9b1cd27e5d549ca97bd45f1946b65f7f0847ba8b6c64dfb7dfe7b81aab1af"
  end

  def install
    binary = Dir["agenteval-*"].first || "agenteval"
    bin.install binary => "agenteval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenteval --version")
  end
end
