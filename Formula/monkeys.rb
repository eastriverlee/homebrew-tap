class Monkeys < Formula
  desc ".env you can hand to an LLM, or git add"
  homepage "https://github.com/eastriverlee/monkeys"
  version "1.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/eastriverlee/monkeys/releases/download/v1.2.0/monkeys-macos-universal.tar.gz"
    sha256 "d5462104fc070f291c36307e430caaf56be085a8bdb3de570ad710167ad66f61"
  end

  on_linux do
    on_arm do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.2.0/monkeys-linux-arm64.tar.gz"
      sha256 "43d83fb236c530e7f173a4ccab9606c53ff310e0d0d196dae83a557986df32da"
    end
    on_intel do
      url "https://github.com/eastriverlee/monkeys/releases/download/v1.2.0/monkeys-linux-x86_64.tar.gz"
      sha256 "09457adf37ad7fb8cfc13a49f36fdf76f72341995d5defd7723f68f0c88dc07e"
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
