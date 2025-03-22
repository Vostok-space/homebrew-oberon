class Vostok < Formula
  desc "Oberon-07 translator"
  homepage "https://vostok.oberon.org"
  url "https://github.com/Vostok-space/vostok/archive/refs/tags/lib-v0.0.10_ost-v0.0.11.tar.gz"
  sha256 "a5bca9b4484f6879e92c7637557eb2c5f1d9a20b722c0ae6cc21a451c56611f3"
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
