class PymontecarloGuiDebug < Formula
  desc "Python interface for Monte Carlo programs (DEBUG)"
  homepage "http://pymontecarlo.github.io"
  url "https://pypi.python.org/packages/02/e4/a243e80559b641d7232d9dee06b6fe97afcf9ad7f66bc7ec95b650d64de5/pyMonteCarlo-GUI-debug-0.1.2.tar.gz"
  sha256 "05463a341ba3d2874fdf431b0e6e6b69428b874f333c21c99b8a14a1570eff10"

  depends_on :python3
  depends_on "freetype" # required for building matplotlib
  depends_on "libpng" # required for building matplotlib
  depends_on "pkg-config" => :build # required for building matplotlib

  def install
    system "python3", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "-U", "wheel", "setuptools", "pip"
    system libexec/"bin/pip", "install", "."

    open("pymontecarlo-gui-debug", "w") do |file|
      file.write "#!/usr/bin/env bash\n"
      file.write libexec/"bin/pymontecarlo-gui-debug"
    end

    bin.install "pymontecarlo-gui-debug"
  end

  test do
    false
  end
end
