class Agenteval < Formula
  desc "Lint, benchmark, and CI gate for AI coding instructions"
  homepage "https://github.com/lukasmetzler/agenteval"
  version "0.8.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-arm64"
      sha256 "ace98bc469d4134bc38bf41950a9d3b060ce06c69c0c29ea944aa8ed13e43163"
    else
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-x64"
      sha256 "d00a022fda5e4ac5a70148270ad71e716d71fa68542a885c78f6ebcc73cdb9cd"
    end
  end

  on_linux do
    url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-linux-x64"
    sha256 "9a70bd58f305f2c9eac4e1eab73e5be25a034f8243c477cb7307c047972f4647"
  end

  def install
    binary = Dir["agenteval-*"].first || "agenteval"
    bin.install binary => "agenteval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenteval --version")
  end
end
