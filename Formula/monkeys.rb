class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "0.12.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v0.12.0/monkeys-macos-universal.tar.gz"
    sha256 "eeaf4563e5cbf19eac7bdef1674eed1d98f37382f806a8f8db6ce6590057b4d3"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.12.0/monkeys-linux-arm64.tar.gz"
      sha256 "b4ecb4e64aca418ea0552f1fd7c9785df81f4393ff9c949eb7f0765b04c24f1b"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.12.0/monkeys-linux-x86_64.tar.gz"
      sha256 "43c322dec3c31d109138337829d7cef892b73be2a848ab018b2ab6b857d1b6d7"
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
