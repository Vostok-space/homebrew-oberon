class Odcey < Formula
  desc      "Converter from BlackBox Component Builder .odc format to plain text"
  homepage  "https://github.com/Vostok-space/odcey"
  url       "https://github.com/Vostok-space/odcey/archive/refs/tags/v0.2.tar.gz"
  sha256    "cfd880e5844501228d5e66ff821ef537705000a0cfc55799597c559810e0a002"
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
