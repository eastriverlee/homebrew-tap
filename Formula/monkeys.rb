class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.1/monkeys-macos-universal.tar.gz"
    sha256 "210e952513fb9943dd4ad3dcae9167ba8e49ac05c0119e723c5e0010a47d16cb"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.1/monkeys-linux-arm64.tar.gz"
      sha256 "04de265e6994b364ae61e4b2bb3b8e44fa50a180be256b792e16d5f187e0ccdd"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.0.1/monkeys-linux-x86_64.tar.gz"
      sha256 "30f5d14e5abce84ea5b69cb00792a3e27c125085dd81d41ab706a2cfcc17eb3d"
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
