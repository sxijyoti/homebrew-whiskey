class Whiskey < Formula
  desc "A dependency-aware static site generator written in Go"
  homepage "https://github.com/sxijyoti/whiskey"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_darwin_amd64.tar.gz"
      sha256 "32bc689ae712eb751ab99c736d284d983e96692f699c60b14f3f769a9a41eb6c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_darwin_arm64.tar.gz"
      sha256 "6f36b67c5e938c891e15320c467911d066f99998c0eae25e67fcdf98a4c3fd56"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_linux_amd64.tar.gz"
      sha256 "2bb092e31c02ad37b7616be104488c5be21d50f5d196e77d4fb9ab6641b0e5f2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.2/whiskey_0.1.2_linux_arm64.tar.gz"
      sha256 "6ea0b111f2902eb64fb7d8d83076081c27cd96f885148861a9fee2819672729f"
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
