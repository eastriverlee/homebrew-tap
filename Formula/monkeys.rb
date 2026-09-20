class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-macos-universal.tar.gz"
    sha256 "5f5ff4fdc99aba7e71e143e0bc13b35862f5109e30bec6fc1408ec022be286b0"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-linux-arm64.tar.gz"
      sha256 "ca0b7a8ea46385467fa82dc21bcfbe3d69e23eda8663c9dd15b37be4f8d362e4"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-linux-x86_64.tar.gz"
      sha256 "ababc545af2dcde677f41046400da267e9fcfba98eea0ed9aa2353bb0f452771"
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
