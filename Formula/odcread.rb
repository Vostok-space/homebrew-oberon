class Odcread < Formula
  desc "Converter of the Oberon/BlackBox .odc binary files"
  homepage "https://github.com/ComdivByZero/odcread"
  url "https://github.com/ComdivByZero/odcread/archive/refs/tags/v0.2.tar.gz"
  sha256 "e459a78f614001899b6d64bde61ad8108d23697cec4838654804be2f9acd88a2"
  license "GPL-3.0+"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    mkdir_p ".git/info"
    system "#{bin}/odcread", "-add-to-git"
  end
end
