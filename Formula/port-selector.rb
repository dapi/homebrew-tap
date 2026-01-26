class PortSelector < Formula
  desc "Port allocator for parallel local dev environments"
  homepage "https://github.com/dapi/port-selector"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector-darwin-arm64"
      sha256 "d7ca99546c873941d9f039243c425adcc2d1c81f65945bcaedb664503dfb4846"
    else
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector-darwin-amd64"
      sha256 "5eace76a84293ee1e27648301622c578c12f0043db3e93aaad7cf7dc1a979988"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector-linux-arm64"
      sha256 "1c10f8fb43180bdb47aa1fd9280f98f8cad12193c384b9bc79af95dddbc0faab"
    else
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector-linux-amd64"
      sha256 "79b341af8e3dee5744b93d3d2172f530330a64d658d01bdfc092fec04940da95"
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
