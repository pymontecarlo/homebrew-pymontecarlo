class Dtsa2 < Formula
  desc "Multiplatform software package for quantitative x-ray microanalysis"
  homepage "http://www.cstl.nist.gov/div837/837.02/epq/dtsa2/"
  url "http://www.cstl.nist.gov/div837/837.02/epq/dtsa2/dtsa2_jupiter.jar"
  sha256 "ed2c549ca85894d7c9a919e9f3ac8f0433a3a355ec568c799d36dda1a1e0599b"

  depends_on :java

  def install
    system "java", "-DINSTALL_PATH=" + lib, "-jar", "dtsa2_jupiter.jar", "-console", "-options-system"

    open("dtsa2", "w") do |file|
      file.write("#!/usr/bin/env bash\n")
      file.write("java -jar " + lib/"dtsa2.jar")
    end
    bin.install "dtsa2"
  end

  test do
    false
  end
end
