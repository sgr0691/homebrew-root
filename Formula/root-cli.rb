class RootCli < Formula
  desc "Deterministic machine environment manager powered by Nix"
  homepage "https://github.com/sgr0691/Root"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sgr0691/Root/releases/download/v#{version}/root-aarch64-apple-darwin.tar.gz"
      sha256 "5922ea7f1bce1d60dba190fd23ddf0453d30b5d345bc43a9e4f0f78518a721b1"

      def install
        bin.install "root"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/sgr0691/Root/releases/download/v#{version}/root-x86_64-apple-darwin.tar.gz"
      sha256 "919db4d137954f6a427c303f52304ca9485886e9d440ffa2e21bc34fadbbcdf1"

      def install
        bin.install "root"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sgr0691/Root/releases/download/v#{version}/root-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06ac37b650bd34014f1db5151ef02f2215c44f1fbc5bb4ad54cf21a37ca38518"

      def install
        bin.install "root"
      end
    end
  end

  test do
    assert_match "root", shell_output("#{bin}/root --version")
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end
end
