class Whiskey < Formula
  desc "A dependency-aware static site generator written in Go"
  homepage "https://github.com/sxijyoti/whiskey"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_darwin_amd64.tar.gz"
      sha256 "a9c110456318dcde7fd564f4628c384befbd76450b3e8aef1dd59b5e4bf44d64"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_darwin_arm64.tar.gz"
      sha256 "ddafc521812e568a6de0db358edf9edd78d82a76d4d4ef20ac4369680b435289"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_linux_amd64.tar.gz"
      sha256 "fde96c9eced467ef1b97de99581d44a9e7a8a983806f135eb9dc19807b7ef314"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_linux_arm64.tar.gz"
      sha256 "694acb953063e6cda1c879739d5a2d77c9308b378c751661919483d7695d716d"
    end
  end

  def install
    bin.install "whiskey"
    bash_completion.install "completions/whiskey.bash" => "whiskey"
    zsh_completion.install "completions/whiskey.zsh" => "_whiskey"
    fish_completion.install "completions/whiskey.fish"
  end

  test do
    assert_match "Whiskey #{version}", shell_output("#{bin}/whiskey version")
  end
end
