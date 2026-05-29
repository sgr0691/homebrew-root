class RootCli < Formula
  desc "Deterministic machine environment manager powered by Nix"
  homepage "https://github.com/sgr0691/Root"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sgr0691/Root/releases/download/v#{version}/root-aarch64-apple-darwin.tar.gz"
    sha256 "5922ea7f1bce1d60dba190fd23ddf0453d30b5d345bc43a9e4f0f78518a721b1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sgr0691/Root/releases/download/v#{version}/root-x86_64-apple-darwin.tar.gz"
    sha256 "a2640b7e5745599669ebb4b57b4fe66bf592272ce08ce9dcddbbfd02c3c1eadf"
  else
    odie "Root v0.1.0 only supports macOS (arm64 and x86_64). Linux support coming soon."
  end

  def install
    bin.install "root"
  end

  test do
    assert_match "root", shell_output("#{bin}/root --version")
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end
end
