class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.5.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.5.0/monkeys-macos-universal.tar.gz"
    sha256 "ffdea690f552b8f42f5e0f69f07c1354b1cfc79b31cf88788a8718577d22b957"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.5.0/monkeys-linux-arm64.tar.gz"
      sha256 "cdac27909ee9f2dfd72b8d0db36bffc45f57c4a8df9732fdf19fd392957bcda2"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.5.0/monkeys-linux-x86_64.tar.gz"
      sha256 "39528973c7103c1577d3cbb4c93ef878cea36001cfac13203983e514c4032372"
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
