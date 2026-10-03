class Stampdrill < Formula
  desc "Run HTTP requests, test plans and load tests written in .stamp files"
  homepage "https://stampdrill.com"
  version "1.4.0"
  license :cannot_represent

  on_macos do
    url "https://github.com/stampdrill/stampdrill/releases/download/cli-1.4.0/stampdrill-macos-universal.tar.gz"
    sha256 "1d47dae95ea81888200604506926aef814bad62dc0a625d275b6376b7f4c1ce2"
  end

  on_linux do
    on_intel do
      url "https://github.com/stampdrill/stampdrill/releases/download/cli-1.4.0/stampdrill-linux-x86_64.tar.gz"
      sha256 "fbdf664177766603c231d7377d6e0a57d0eebab47b6f0765389a5ffd70ad284b"
    end
    on_arm do
      url "https://github.com/stampdrill/stampdrill/releases/download/cli-1.4.0/stampdrill-linux-arm64.tar.gz"
      sha256 "2893664ac84c8a8fbb4564608568e13045b3b134ea49a6564ff3245dc786e0b3"
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
    assert_match "stamp #{version}", shell_output("#{bin}/stamp --version")
    assert_match "1 request", shell_output("#{bin}/stamp check #{testpath} --no-color")
  end
end
