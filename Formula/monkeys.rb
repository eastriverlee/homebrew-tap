class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.3.0/monkeys-macos-universal.tar.gz"
    sha256 "803a313066d5bf456e43413b0e16dd570968f48d65708b2b9fdb6b825c14f456"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.3.0/monkeys-linux-arm64.tar.gz"
      sha256 "e6d8397158db13cf50eb0fd6d95771580c85a78f3cc0e6945835f74ed83deb2f"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.3.0/monkeys-linux-x86_64.tar.gz"
      sha256 "f2f71ece22872fa695347ea51e881a24a099ff36c9adee9908e7d21568b55468"
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
