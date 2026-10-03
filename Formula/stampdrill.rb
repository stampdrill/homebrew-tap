class Stampdrill < Formula
  desc "Run API requests, test plans and load tests written in plain text .stamp files"
  homepage "https://stampdrill.com"
  version "1.3.0"
  license :cannot_represent

  on_macos do
    url "https://github.com/stampdrill/stampdrill/releases/download/cli-1.3.0/stampdrill-macos-universal.tar.gz"
    sha256 "e3f7ae535e15b76c9455df9283dd096ca91a010b39c58a6b349664a8981edb42"
  end

  on_linux do
    on_intel do
      url "https://github.com/stampdrill/stampdrill/releases/download/cli-1.3.0/stampdrill-linux-x86_64.tar.gz"
      sha256 "2bca20640ea6e91e40b6a7413496765e516a742212607e37e35cda13642e0565"
    end
    on_arm do
      url "https://github.com/stampdrill/stampdrill/releases/download/cli-1.3.0/stampdrill-linux-arm64.tar.gz"
      sha256 "9ef10a952d8cb6b68df2768b712399d5ee715fbba8eec7ab237730c3beba0205"
    end
  end

  def install
    bin.install "stampdrill"
    # The short name for daily use: stamp test .
    bin.install_symlink bin/"stampdrill" => "stamp"
    doc.install "TERMS.md"
  end

  test do
    (testpath/"hello.stamp").write <<~STAMP
      ### Hello
      GET https://example.com
    STAMP
    assert_match "stampdrill #{version}", shell_output("#{bin}/stampdrill --version")
    assert_match "1 request", shell_output("#{bin}/stampdrill check #{testpath} --no-color")
  end
end
