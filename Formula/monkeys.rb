class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "0.13.1"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v0.13.1/monkeys-macos-universal.tar.gz"
    sha256 "ed77e28ed0b304ce3add2a4eda1612359e12fa4974b3b8cc2b9a703a3ee82afa"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.13.1/monkeys-linux-arm64.tar.gz"
      sha256 "a58a4a294dee55acabf733bf6e0a7872816cb8a90c9c681aa9e981e93251c650"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.13.1/monkeys-linux-x86_64.tar.gz"
      sha256 "2aceea741301b590a0d7560f4e6f473785252af5f8af38665f13bfc73cb7d016"
    end
  end

  def install
    bin.install "monkeys"
  end

  def caveats
    return unless OS.linux?

    <<~TEXT
      On Linux, monkeys reaches the vault through secret-tool:
        libsecret-tools on Debian and Ubuntu, libsecret on Fedora and Arch.
    TEXT
  end

  test do
    assert_match "monkeys", shell_output("#{bin}/monkeys help")
  end
end
