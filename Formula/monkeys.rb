class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.4.1"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.1/monkeys-macos-universal.tar.gz"
    sha256 "ff15a3ed1267ea9879687d94bdec5064a3dadc8ace7730a764f7f77f5138aec6"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.1/monkeys-linux-arm64.tar.gz"
      sha256 "c6bd887d15dbe1e4c45554be92b8466e9d92dc3ecf1727dc3493be921d8fc027"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.1/monkeys-linux-x86_64.tar.gz"
      sha256 "d8fbe1d0f3f252302023255c5d5de8e2463b31623b86ad7c18fa42596fa88be6"
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
