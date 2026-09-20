class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.6.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.6.0/monkeys-macos-universal.tar.gz"
    sha256 "fbf39fd03d4dfa5a9c0ef9c63f15dd619ae2a83aee22afadbeefb15e06031f1d"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.6.0/monkeys-linux-arm64.tar.gz"
      sha256 "2c5c2973684daeceb8d15337eee2d6fe1bea8cbc3d274413d4cc47feed9dbab4"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.6.0/monkeys-linux-x86_64.tar.gz"
      sha256 "0ac23ce38d264da21f8c57b53662e496c6ac79f00b415f66843d0876cc3794c8"
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
