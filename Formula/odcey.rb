class Odcey < Formula
  desc "Converter from BlackBox Component Builder .odc format to plain text"
  homepage "https://github.com/Vostok-space/odcey"
  url "https://github.com/Vostok-space/odcey/archive/refs/tags/v0.d.3.tar.gz"
  sha256 "d6a38662d8e187660b2243de9fcab23eed36d0fb2add7edc2746ec4d4efe8200"
  license "Apache-2.0"

  depends_on "vostok-space/oberon/vostok" => [:build]

  def install
    system "ost", "to-bin", "odcey.Cli", "odcey", "-m", ".", "-cc", "cc -s -O1 -flto"
    cp "odcey", bin
  end

  test do
    system bin + "/odcey", "help"
  end
end
