class Whiskey < Formula
  desc "A dependency-aware static site generator written in Go"
  homepage "https://github.com/sxijyoti/whiskey"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_darwin_amd64.tar.gz"
      sha256 "bfa1f36d63f3900bdfc6c308a0677d0dc9b6aa7707054eb5cb2368b183e89736"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_darwin_arm64.tar.gz"
      sha256 "0639ee801d1c4cf2ee16695cfa3f6be3edac914c96338ad7ebdec32df3968ff8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_linux_amd64.tar.gz"
      sha256 "af902fb83919639dc2a7a8734014dbf9f3e4651ad14cced6ba6d95b1d18896cf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_linux_arm64.tar.gz"
      sha256 "8ee4bc349d41e8d70d2817724c94eff8a03312de1d0067725e1d979789f97574"
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
