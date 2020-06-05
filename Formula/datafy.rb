class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.18.0/datafy_darwin_amd64.tar.gz"
  version "0.18.0"
  sha256 "a5e4522e6e3e397eee61624cb232f5902a4a90400cd177c4c3ee25d0ac507b6e"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
