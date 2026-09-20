class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-macos-universal.tar.gz"
    sha256 "0a610b7b7b449c42f5bbf5f3b9c4691992986e92c79281ad98e442fb33c3cfd2"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-linux-arm64.tar.gz"
      sha256 "d48b369d98496a512430fcf2018f3c2a3c35019e0d541e9ea48b1c30b01b9e26"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.0/monkeys-linux-x86_64.tar.gz"
      sha256 "1e28dc2e3173f6847dbac82e7e3eeff30b9efebe900fb02cf35b0dc62fd9f712"
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
