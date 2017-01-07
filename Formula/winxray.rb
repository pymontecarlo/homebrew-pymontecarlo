class Winxray < Formula
  desc "Monte Carlo simulation of electron trajectory in solids"
  homepage "http://montecarlomodeling.mcgill.ca/software/winxray/winxray.html"
  url "http://montecarlomodeling.mcgill.ca/download/winxray-1.4.2.zip"
  sha256 "c2b4f64da8d5236e9be8a8909aef9e7e4f2e797193badc267fbf600504e775da"

  depends_on "wine"

  def install
    lib.install Dir["*"]

    open("winxray", "w") do |file|
      file.write("#!/usr/bin/env bash\n")
      file.write("wine " + lib/"WinXRay.exe" + " $@")
    end
    bin.install "winxray"
  end

  test do
    false
  end
end
