class Vostok < Formula
  desc "Oberon-07 translator"
  homepage "http://vostok.oberon.org"
  url "https://github.com/Vostok-space/vostok/archive/refs/tags/lib-v0.0.9_ost-v0.0.10.tar.gz"
  sha256 "10e146e3ac23cc5beeef62cc61038f6c874f5f3588f745eb59da875c1b41141f"
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
