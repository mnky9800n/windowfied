class Windowfied < Formula
  desc "Windows-style commands for macOS"
  homepage "https://github.com/mnky9800n/homebrew-tools"
  url "https://github.com/mnky9800n/homebrew-tools/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "a0eafdd9c7eb7f1053e858837e4bafdf5d6e028e67e4adb6a9841808a503a66e"
  license "MIT"

  def install
    bin.install "dir.sh" => "dir"
  end

  test do
    system "#{bin}/dir", "--help"
  end
end
