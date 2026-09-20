class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.0/monkeys-macos-universal.tar.gz"
    sha256 "ad27a24517c72ead9d08d91dcdcb087527635acb0354d79ba9955a7723a507bc"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.0/monkeys-linux-arm64.tar.gz"
      sha256 "694aaa2a73d5cda1081c1533121504ed178d2e6e6b4b4be541c3f9616d63144f"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.1.0/monkeys-linux-x86_64.tar.gz"
      sha256 "9a0fabb571a125751cccdeda08a88fba72f611944554357691704ff468ddabba"
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
