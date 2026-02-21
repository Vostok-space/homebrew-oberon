class Odcey < Formula
  desc      "Converter from BlackBox Component Builder .odc format to plain text"
  homepage  "https://github.com/Vostok-space/odcey"
  url       "https://github.com/Vostok-space/odcey/archive/refs/tags/v0.4.tar.gz"
  sha256    "288587fa9cb5867f18e2730967902e8c467fddd02f0d3c9dc9e4d7d891134c7a"
  license   "Apache-2.0"

  depends_on "vostok-space/oberon/vostok" => :build

  def install
    mkdir_p bin
    system "ost", "to-bin", "odcey.Cli", "#{bin}/odcey", "-m", ".", "-cc", "cc -s -O1 -flto=auto"
  end

  test do
    system "#{bin}/odcey", "help"
  end
end
