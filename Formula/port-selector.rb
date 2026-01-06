class PortSelector < Formula
  desc "Port allocator for parallel local dev environments"
  homepage "https://github.com/dapi/port-selector"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_#{version}_darwin_arm64"
      sha256 "600c5140e835ea85cba2b3823b83d6dc9a83e8475b126422e9cd2f1778ca1c1d"
    else
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_#{version}_darwin_amd64"
      sha256 "ad4a94c2cc5a3e0bc7fabeaffd1ec5894e42d21adfe8c032eec0c03c32e84747"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_#{version}_linux_arm64"
      sha256 "e80874f3d11edb101a51a35f2dc92d2faabdb49ac9d2dd8e68e9496118c1d680"
    else
      url "https://github.com/dapi/port-selector/releases/download/v#{version}/port-selector_#{version}_linux_amd64"
      sha256 "d68765028ccfeef88e91e0da7f902a4eaf3d33c26c54fa56191841c350ef81d1"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "port-selector_#{version}_darwin_arm64" : "port-selector_#{version}_darwin_amd64"
    else
      Hardware::CPU.arm? ? "port-selector_#{version}_linux_arm64" : "port-selector_#{version}_linux_amd64"
    end
    bin.install binary_name => "port-selector"
  end

  test do
    system "#{bin}/port-selector", "--help"
  end
end
