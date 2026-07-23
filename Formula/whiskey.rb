class Whiskey < Formula
  desc "A dependency-aware static site generator written in Go"
  homepage "https://github.com/sxijyoti/whiskey"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.3/whiskey_0.1.3_darwin_amd64.tar.gz"
      sha256 "62413bb48eef5472456fb2c1fe9154108b00da24e5a5e2530fecff4d78159a68"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.3/whiskey_0.1.3_darwin_arm64.tar.gz"
      sha256 "337b5199c112857ec7eba001ccccaeb29d1af1195ae037d13fc5157ea9aa6927"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.3/whiskey_0.1.3_linux_amd64.tar.gz"
      sha256 "dbc2f7b88873f402b709f510d921191b6f4065ea85638114e33df98a3fbf830c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/sxijyoti/whiskey/releases/download/v0.1.3/whiskey_0.1.3_linux_arm64.tar.gz"
      sha256 "14bfd0e92aa777832684341d9c65d05f275ca745adc2a192385c120880506860"
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
