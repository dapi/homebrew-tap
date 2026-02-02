class PortSelector < Formula
  desc "Port allocator for parallel local dev environments"
  homepage "https://github.com/dapi/port-selector"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v0.9.3/port-selector-darwin-arm64"
      sha256 "e56c3f5ce06dbe6ff917b7fc8dbb2728f7033444bd8c2237cd9502d684f1913e"
    else
      url "https://github.com/dapi/port-selector/releases/download/v0.9.3/port-selector-darwin-amd64"
      sha256 "9634fd319ddb8a4792e1ac0809046890471629ed16d2d7ae677399fe2c36d144"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v0.9.3/port-selector-linux-arm64"
      sha256 "c7968d51ec357155df67a305103b1596b1497ba380cc272a1bd9d9e1a904c20e"
    else
      url "https://github.com/dapi/port-selector/releases/download/v0.9.3/port-selector-linux-amd64"
      sha256 "a1b0ae091883ae1570c7c14c9794bcb9298473f2f444194aa3e2618d862d6e72"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "port-selector-darwin-arm64" : "port-selector-darwin-amd64"
    else
      Hardware::CPU.arm? ? "port-selector-linux-arm64" : "port-selector-linux-amd64"
    end
    bin.install binary_name => "port-selector"
  end

  test do
    system "#{bin}/port-selector", "--help"
  end
end
