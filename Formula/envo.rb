class Envo < Formula
  desc "Portable encrypted environments for AI agents: secrets, skills, and provider auth in one command"
  homepage "https://envo.sh"
  version "0.7.0"
  license "UNLICENSED"

  BASE = "https://tj5cc1aywcknxvx1.public.blob.vercel-storage.com/cli/v0.7.0"

  on_macos do
    on_arm do
      url "#{BASE}/envo-darwin-arm64"
      sha256 "60221131154fe94de9afbed0394edcd0ecda714eec3c38dfb3463f53b14acba9"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/envo-linux-arm64"
      sha256 "5ef0f8a509abcef32720de3f97d648416f15a5968da8b042ea43a527f7405af8"
    end
    on_intel do
      url "#{BASE}/envo-linux-x64"
      sha256 "50e51096dacfd9b8f3bd2e5a3896efbfb7b58b6c7a13f905ff66d6f0cd530f8b"
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
