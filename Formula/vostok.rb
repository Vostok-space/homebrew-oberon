class Vostok < Formula
  desc "Oberon-07 translator"
  homepage "http://vostok.oberon.org"
  url "https://github.com/Vostok-space/vostok/archive/refs/tags/lib-v0.0.8_ost-v0.0.9.tar.gz"
  sha256 "8312abb89eec463302511d5ce476892037f92b9f44e6243f07cf0641265ca997"
  license "LGPL-3.0-only"

  def install
    system "./init.sh"
    system "result/bs-ost", "run", "make.Build", "-infr", ".", "-m", "source"
    mkdir_p bin
    mkdir_p share
    system "result/ost", "run", "make.InstallTo(\"#{prefix}\")", "-infr", ".", "-m", "source"
  end

  test do
    assert_match "34131456", shell_output("#{bin}/ost run 'log.i(3456 * 9876 + ORD({}))'")
  end
end
