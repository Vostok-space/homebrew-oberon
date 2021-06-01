class Odcread < Formula
  desc "Converter of the Oberon/BlackBox .odc binary files"
  homepage "https://github.com/ComdivByZero/odcread"
  url "https://github.com/ComdivByZero/odcread/archive/refs/tags/v0.1.tar.gz"
  sha256 "21f75ab11416bc107e90c353512f0e3597338b83e70663d21a5f84c0e28d4c4a"
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
