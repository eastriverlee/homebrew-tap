class Monkeys < Formula
  desc "Cross-platform .env alternative for the LLM era"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.0/monkeys-macos-universal.tar.gz"
    sha256 "6dab54f7c44c6812b92c1bae9783cce264faf6973c351020fcd2ee74ad05d388"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.0/monkeys-linux-arm64.tar.gz"
      sha256 "5e814c413b26d0c2365c10eb00536df14346a81654575218ef25564379f4b057"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.4.0/monkeys-linux-x86_64.tar.gz"
      sha256 "b3cca0c414306992eca08e21b72410992e81c70152cf8cef5e6c172df68dd10a"
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
