class Odcey < Formula
  desc      "Converter from BlackBox Component Builder .odc format to plain text"
  homepage  "https://github.com/Vostok-space/odcey"
  url       "https://github.com/Vostok-space/odcey/archive/refs/tags/v0.3.2.tar.gz"
  sha256    "25fc432e1c95631d5d119aac7dfc078fe82ccc5699b550affd28a1ed635a29e8"
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
