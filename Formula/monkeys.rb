class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.0/monkeys-macos-universal.tar.gz"
    sha256 "cd254822d62055b77a3d4023a82b2993713469039e88307cf07923a05ae3fe6c"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.0/monkeys-linux-arm64.tar.gz"
      sha256 "66d34c3b49be1d9f509e600b88a82c73890e5b40f0e874dc9756edefa99c40d4"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.0/monkeys-linux-x86_64.tar.gz"
      sha256 "c922e894b552826c8938bc86fc39d22dc8a709b74cdd4c893c15f428395793c1"
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
