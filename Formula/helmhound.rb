# frozen_string_literal: true

class Helmhound < Formula
  desc 'A tool for Helm chart analysis and security scanning'
  homepage 'https://github.com/Drumato/helmhound'
  url 'https://github.com/Drumato/helmhound/archive/refs/tags/v0.1.0.tar.gz'
  sha256 '1332b55ba29a69f60b96f9c01f02d022e749c983fd4345514ef4d909021320fb'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', *std_go_args(ldflags: '-s -w'), '.'
    bin.install 'helmhound'
  end

  test do
    system "#{bin}/helmhound", '--version'
  end
end
