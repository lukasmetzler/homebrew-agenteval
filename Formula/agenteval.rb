class Agenteval < Formula
  desc "Lint, benchmark, and CI gate for AI coding instructions"
  homepage "https://github.com/lukasmetzler/agenteval"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-arm64"
      sha256 "9cece4a0807803ed5a784b8399dd758fe65b76bcc8d1b11dc6685cf58e96f423"
    else
      url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-darwin-x64"
      sha256 "73e967c0525edb7fd459c48a54cc061f8786705d0dc554f9833868c3c3c54707"
    end
  end

  on_linux do
    url "https://github.com/lukasmetzler/agenteval/releases/download/v#{version}/agenteval-linux-x64"
    sha256 "bc145ae73e01b4271b46a25d9128608f1c2376984825f05d82ba750dd29079cf"
  end

  def install
    binary = Dir["agenteval-*"].first || "agenteval"
    bin.install binary => "agenteval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenteval --version")
  end
end
