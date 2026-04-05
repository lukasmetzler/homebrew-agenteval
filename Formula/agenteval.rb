class Agenteval < Formula
  desc "Lint, benchmark, and CI gate for AI coding instructions"
  homepage "https://github.com/lukasmetzler/agenteval"
  version "0.7.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-arm64"
      sha256 "650d1f21d518a28f64c43482ca8480d4ec7d70efb646c60c02300b78a450b53b"
    else
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-x64"
      sha256 "ec69e91ab78886f337b8ddc7e12e275dbf3195c66139e6d354995cba521e82b0"
    end
  end

  on_linux do
    url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-linux-x64"
    sha256 "c4f1a3df0433f0e7b5a41a21ec1f3f0ca0ee0afa61444d5d62c2739ac77ad9e4"
  end

  def install
    binary = Dir["agenteval-*"].first || "agenteval"
    bin.install binary => "agenteval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenteval --version")
  end
end
