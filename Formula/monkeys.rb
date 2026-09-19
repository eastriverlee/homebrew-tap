class Monkeys < Formula
  desc "Cross-platform dotenv alternative for the LLM era: secrets in the keyring, spent one command at a time"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.1.2"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.2/monkeys-macos-universal.tar.gz"
    sha256 "bd0f0669d4f34e576d79a3e5119158bcc570129158b8b87a6755379c79c1f3b2"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.2/monkeys-linux-arm64.tar.gz"
      sha256 "e143eb9e0b8bc85896dd757841c73fe6c109e8a2ae443714ae62eb00cbbb434b"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.2/monkeys-linux-x86_64.tar.gz"
      sha256 "924436310a79512be0c3fa6320e89bf1be652547b036cff186e63a0b0e6a81cc"
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
