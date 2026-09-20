class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.7.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.7.0/monkeys-macos-universal.tar.gz"
    sha256 "270798c6b562ec5a30fc5abf3c1abbe7f7dbb6e5b7147fad08d20d855cc5fc54"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.7.0/monkeys-linux-arm64.tar.gz"
      sha256 "603d24bbe6a9f770736b82ec3b91f90519816fe509aea9741f2041225cf34304"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.7.0/monkeys-linux-x86_64.tar.gz"
      sha256 "01b1bdbfd1e6af52e221e59c3bd35617eb95a0a754ac1b9a79dea4a332b78aad"
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
