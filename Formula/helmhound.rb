# frozen_string_literal: true

class Helmhound < Formula
  desc 'A tool for Helm chart analysis and security scanning'
  homepage 'https://github.com/Drumato/helmhound'
  url 'https://github.com/Drumato/helmhound/archive/refs/tags/v0.2.0.tar.gz'
  sha256 'bacaf5b6131f27b20408fcf33c2d3abd9b479061e01a1efc8636b850078afb88'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-ldflags', '-s -w', '-o', 'helmhound', '.'
    bin.install 'helmhound'
  end

  test do
    system "#{bin}/helmhound", '--version'
  end
end
