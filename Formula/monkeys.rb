class Monkeys < Formula
  desc "Cross-platform dotenv alternative for the LLM era: secrets in the keyring, spent one command at a time"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.1/monkeys-macos-universal.tar.gz"
    sha256 "7ca6a57322b301135dc2ba8201fc737bcb40ec15c42923a3b21a938c7afc9e7b"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.1/monkeys-linux-arm64.tar.gz"
      sha256 "43e4786f78303ac3b80428d0afb8af0896e524826a55980de015687dcedc4c04"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.1/monkeys-linux-x86_64.tar.gz"
      sha256 "ca4ef9eaddd6950bb5e1c62d1c735b4c0e84b6c7e169306f153ea5c568cb8d3e"
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
