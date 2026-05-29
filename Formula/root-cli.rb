class RootCli < Formula
  desc "Deterministic machine environment manager powered by Nix"
  homepage "https://github.com/sgr0691/Root"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sgr0691/Root/releases/download/v#{version}/root-aarch64-apple-darwin.tar.gz"
    sha256 "5922ea7f1bce1d60dba190fd23ddf0453d30b5d345bc43a9e4f0f78518a721b1"

    def install
      bin.install "root"
    end
  else
    odie "Root is currently only available on Apple Silicon (aarch64) macOS"
  end

  test do
    assert_match "root", shell_output("#{bin}/root --version")
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end
end
