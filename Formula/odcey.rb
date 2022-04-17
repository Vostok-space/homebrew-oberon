class Odcey < Formula
  desc      "Converter from BlackBox Component Builder .odc format to plain text"
  homepage  "https://github.com/Vostok-space/odcey"
  url       "https://github.com/Vostok-space/odcey/archive/refs/tags/v0.1.0.tar.gz"
  sha256    "2c8bb3723412531ef66362eaa4034c6f71dc66435b650089b0d9edf1d2a42a2d"
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
