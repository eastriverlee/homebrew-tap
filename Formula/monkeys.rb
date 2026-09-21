class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.0/monkeys-macos-universal.tar.gz"
    sha256 "e11403c2ba7bf2a273f4f3d7e5eff543f787c0972f061a7eb84596b3f908ec45"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.0/monkeys-linux-arm64.tar.gz"
      sha256 "090a8572d41285e1caca84ee977a75eb4c87807284456a659ad0f94de4a57d3b"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.0/monkeys-linux-x86_64.tar.gz"
      sha256 "3c8f10b18e47e23d5191827c011d4162a705b275b364cf4fbd26427dcf6f210d"
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
