class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "0.13.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v0.13.0/monkeys-macos-universal.tar.gz"
    sha256 "f4b428acbb9167964569b77fdd2c9fef6055465234495d051eba6f3e5bb36ded"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.13.0/monkeys-linux-arm64.tar.gz"
      sha256 "4ddcf95f162a0f9588cc3db4b8cbb6df4b76c5d4930f09e4f719120ba3543e0f"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v0.13.0/monkeys-linux-x86_64.tar.gz"
      sha256 "763001f5f0d3d6716f011e76ca77ffa3ff4aed398ec9f14ef10b839b2c532014"
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
