class PortSelector < Formula
  desc "Port allocator for parallel local dev environments"
  homepage "https://github.com/dapi/port-selector"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_darwin_arm64.tar.gz"
      sha256 "PUT_SHA256_HERE"
    else
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_darwin_amd64.tar.gz"
      sha256 "PUT_SHA256_HERE"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_linux_arm64.tar.gz"
      sha256 "PUT_SHA256_HERE"
    else
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_linux_amd64.tar.gz"
      sha256 "PUT_SHA256_HERE"
    end
  end

  def install
    bin.install "port-selector"
  end

  test do
    system "#{bin}/port-selector", "--help"
  end
end
