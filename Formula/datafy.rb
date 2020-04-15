class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.13.0/datafy_darwin_amd64.tar.gz"
  version "0.13.0"
  sha256 "83e6472dce57f119d0952733c06f2c61032cbb3f5d0833241152ca53cd3712d7"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
