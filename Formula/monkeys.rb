class Monkeys < Formula
  desc "Cross-platform dotenv alternative for the LLM era: secrets in the keyring, spent one command at a time"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-macos-universal.tar.gz"
    sha256 "8d11326e88b259ac5f26e6f3b172d3ae1cbb1bde3ca07ebecb2f05960d8b8a73"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-linux-arm64.tar.gz"
      sha256 "21dbbff14076c27062fe8016bd9fcdc8dd939d48a3e8560c756f7b4e0f32404a"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-linux-x86_64.tar.gz"
      sha256 "b3dee23aa24fd9b9a3d24f5eb2d88b16dcf21f6f242ab85d5f26b61aa3f693b8"
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
