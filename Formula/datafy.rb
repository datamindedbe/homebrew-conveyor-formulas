class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.20.1/datafy_darwin_amd64.tar.gz"
  version "0.20.1"
  sha256 "ba6543047c10379d22165c3e9b0f6ff601b1aea0e9a5311075c5efc031c049b0"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
