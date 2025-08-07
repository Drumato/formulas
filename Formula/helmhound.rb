# frozen_string_literal: true

class Helmhound < Formula
  desc 'A tool for Helm chart analysis and security scanning'
  homepage 'https://github.com/Drumato/helmhound'
  url 'https://github.com/Drumato/helmhound/archive/refs/tags/v0.1.0.tar.gz'
  sha256 'REPLACE_WITH_ACTUAL_SHA256'
  license 'MIT'

  def install
    # システムにGoがあるかチェック、なければエラーメッセージ
    go_cmd = which('go')
    odie 'Go is required but not found. Install with: brew install go' if go_cmd.nil?

    system go_cmd, 'build', *std_go_args(ldflags: '-s -w'), '.'
    
    bin.install 'helmhound.exe' => 'helmhound'
  end

  test do
    system "#{bin}/helmhound", '--version'
  end
end
