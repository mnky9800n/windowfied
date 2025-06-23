class Windowfied < Formula
  desc "Windows-style commands for macOS"
  homepage "https://github.com/mnky9800n/homebrew-tools"
  url "https://github.com/mnky9800n/homebrew-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3e7e656643564b457a3d42bf33c961c12f3042509f650f1a5a6b495a6c6828aa"
  license "MIT"

  def install
    bin.install "dir.sh" => "dir"
  end

  test do
    system "#{bin}/dir", "--help"
  end
end
