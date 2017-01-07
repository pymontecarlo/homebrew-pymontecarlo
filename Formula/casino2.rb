class Casino2 < Formula
  desc "Monte Carlo simulation of electron trajectory in solids"
  homepage "http://www.gel.usherbrooke.ca/casino/"
  url "http://www.gel.usherbrooke.ca/casino/releases/CASINO_v2.4.8.1.zip"
  sha256 "d2cc72b810873ccf31ff8e9286403b9fee88e8c988a5f425d7b92a5405da2ea2"

  depends_on "wine"
  depends_on "curl"

  def install
    lib.install Dir["*"]

    open("casino2", "w") do |file|
      file.write("#!/usr/bin/env bash\n")
      file.write("wine " + lib/"wincasino2.exe" + " $@")
    end
    bin.install "casino2"
    
    name=`id -F`
    system "curl", "--form", "\"Name=" + name.strip + "\"", "http://www.gel.usherbrooke.ca/casino/download.php"
  end

  test do
    false
  end
end
