class Envo < Formula
  desc "Portable encrypted environments for AI agents: secrets, skills, and provider auth in one command"
  homepage "https://envo.sh"
  version "0.8.0"
  license "UNLICENSED"

  BASE = "https://tj5cc1aywcknxvx1.public.blob.vercel-storage.com/cli/v0.8.0"

  on_macos do
    on_arm do
      url "#{BASE}/envo-darwin-arm64"
      sha256 "8c02ecbb36994e93ea3432bb55d9403ba10f5317dd240566e253f398d0652edb"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/envo-linux-arm64"
      sha256 "03811ca9a5e60aed2699d0cdaf307edee48cdb3b55f2f193dc22b44b5e8073db"
    end
    on_intel do
      url "#{BASE}/envo-linux-x64"
      sha256 "bc75c4a9cf17a15dd33dad47a0f60a7118cbc9ded453be73eb489d943421cb47"
    end
  end

  def install
    binary = Dir["envo-*"].first
    bin.install binary => "envo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envo --version")
  end
end
