class Odcey < Formula
  desc      "Converter from BlackBox Component Builder .odc format to plain text"
  homepage  "https://github.com/Vostok-space/odcey"
  url       "https://github.com/Vostok-space/odcey/archive/refs/tags/v0.3.tar.gz"
  sha256    "46dd12b4642682039f9472e72e87b2d53c10085113d947c7b3d1815c70631dbb"
  license   "Apache-2.0"

  depends_on "vostok-space/oberon/vostok" => :build

  def install
    mkdir_p bin
    system "ost", "to-bin", "odcey.Cli", "#{bin}/odcey", "-m", ".", "-cc", "cc -s -O1 -flto"
  end

  test do
    system "#{bin}/odcey", "help"
  end
end
