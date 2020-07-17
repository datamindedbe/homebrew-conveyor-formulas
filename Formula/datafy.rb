class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.19.0/datafy_darwin_amd64.tar.gz"
  version "0.20.0"
  sha256 "4859dd826d51378e26a18cef988b3fb4d2d8935aec7bc02a5d67bb8dedd616f1"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
