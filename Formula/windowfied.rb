class Windowfied < Formula
  desc "Windows-style commands for macOS"
  homepage "https://github.com/mnky9800n/homebrew-tools"
  url "https://github.com/mnky9800n/homebrew-tools/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "c6e5aaaa3d9fda0adc71dc12e585781d77b84f3f9b6e1ec02c5ab5259f7c74f5"
  license "MIT"

  def install
    bin.install "dir.sh" => "dir"
  end

  test do
    system "#{bin}/dir", "--help"
  end
end
