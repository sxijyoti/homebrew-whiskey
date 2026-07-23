class Whiskey < Formula
  desc "A dependency-aware static site generator written in Go"
  homepage "https://github.com/sxijyoti/whiskey"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_darwin_amd64.tar.gz"
      sha256 "fbaee1f3839e53435242b286cb5e797ff17a23a94b6c26310fdd7156c8c34862"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_darwin_arm64.tar.gz"
      sha256 "6d4e84b4f93d9e2a4e8a27b618cf6347f61cddfd579f2f019898762716290648"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_linux_amd64.tar.gz"
      sha256 "32f9eb8f42317e6fc184451ebd6757fa83f350e5b5a966818d1447daa929437e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v1.0.0/whiskey_1.0.0_linux_arm64.tar.gz"
      sha256 "e50403452886167f879bdaac17af9f0546122ccb65b1362875673774481e6b03"
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
