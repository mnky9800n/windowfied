class Windowfied < Formula
  desc "Windows-style commands for macOS"
  homepage "https://github.com/mnky9800n/homebrew-tools"
  url "https://github.com/mnky9800n/homebrew-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4daac648fe3816211402059d9b6337b1742edf7d65edf6951ea7fe5887819d7c"
  license "MIT"

  def install
    bin.install "dir.sh" => "dir"
  end

  test do
    system "#{bin}/dir", "--help"
  end
end
