class Agenteval < Formula
  desc "Lint, benchmark, and CI gate for AI coding instructions"
  homepage "https://github.com/lukasmetzler/agenteval"
  version "0.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-arm64"
      sha256 "a0b177deb54eabda2c8cc8c080fb36f737d56d01531244dcf7e7c3be0ad40119"
    else
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-x64"
      sha256 "73088c60cc78c95bdac9af2e4488a448cd38820ed9d97eafcb8d047a37cac91c"
    end
  end

  on_linux do
    url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-linux-x64"
    sha256 "626a45c22ccaf363da9c2440ea68cc2ce92ad49aeef81de7acacc378916a65ec"
  end

  def install
    binary = Dir["agenteval-*"].first || "agenteval"
    bin.install binary => "agenteval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenteval --version")
  end
end
