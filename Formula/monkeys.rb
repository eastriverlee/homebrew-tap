class Monkeys < Formula
  desc "Cross-platform dotenv alternative for the LLM era: secrets in the keyring, spent one command at a time"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.3.0/monkeys-macos-universal.tar.gz"
    sha256 "f035848c8fe8f5be9da823d39b0f3aff9639e68e8065aa8f338bdef952a12b47"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.3.0/monkeys-linux-arm64.tar.gz"
      sha256 "f035848c8fe8f5be9da823d39b0f3aff9639e68e8065aa8f338bdef952a12b47"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.3.0/monkeys-linux-x86_64.tar.gz"
      sha256 "f035848c8fe8f5be9da823d39b0f3aff9639e68e8065aa8f338bdef952a12b47"
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
