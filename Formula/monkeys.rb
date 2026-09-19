class Monkeys < Formula
  desc "Environment variables kept in your operating system's keyring, handed to one command at a time"
  homepage "https://github.com/eastriverlee/monkeys"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v0.1.0/monkeys-macos-universal.tar.gz"
    sha256 "d9ee69a3e74bcea13fec89456a2561f25e1d4f7042a19e8df1a7471b022302bb"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.1.0/monkeys-linux-arm64.tar.gz"
      sha256 "c1c4a067542c49c58360737e4d1219b54d9b2e3f3faeec40390d810d203180be"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.1.0/monkeys-linux-x86_64.tar.gz"
      sha256 "2a8efb90eea722a69e82e3874f5d74611546ec674fcfede0f8a2c36f08fdcd7c"
    end
  end

  def install
    bin.install "monkeys"
  end

  def caveats
    return unless OS.linux?

    <<~TEXT
      On Linux, monkeys reaches the keyring through secret-tool:
        libsecret-tools on Debian and Ubuntu, libsecret on Fedora and Arch.
    TEXT
  end

  test do
    assert_match "monkeys", shell_output("#{bin}/monkeys help")
  end
end
