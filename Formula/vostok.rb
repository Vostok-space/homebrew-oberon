class Vostok < Formula
  desc "Oberon-07 translator"
  homepage "http://vostok.oberon.org"
  url "https://github.com/Vostok-space/vostok/archive/refs/tags/lib-v0.0.5_ost-v0.0.6.tar.gz"
  sha256 "5512e583dd049755eadc416f3317937807b5af82ed527e82911074a9048ee707"
  license "LGPL-3.0-only"

  def install
    system "./init.sh"
    system "result/bs-ost", "run", "make.Build", "-infr", ".", "-m", "source"
    system "mkdir", "-p", "#{prefix}/bin", "#{prefix}/share"
    system "result/ost", "run", "make.InstallTo(\"#{prefix}\")", "-infr", ".", "-m", "source"
  end

  test do
    assert_match "34131456", shell_output("#{bin}/ost run 'log.i(3456 * 9876 + ORD({}))'")
  end
end
