class Monkeys < Formula
  desc "Cross-platform dotenv alternative for the LLM era: secrets in the keyring, spent one command at a time"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.2.0/monkeys-macos-universal.tar.gz"
    sha256 "cbf7275dd4406cab011fd9513e686fbeab03eb557a17b02bffc9395a4d4e21d4"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.2.0/monkeys-linux-arm64.tar.gz"
      sha256 "21bd7bfb8434a0f5857383848a7c2d5182f98d504fa4e7dc87aeab8cfac7c15b"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.2.0/monkeys-linux-x86_64.tar.gz"
      sha256 "1041f7413baebd7a2525ed230d61986f59d3b9f053e0d80314555bbff6160778"
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
