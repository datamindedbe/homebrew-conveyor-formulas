class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.16.0/datafy_darwin_amd64.tar.gz"
  version "0.15.0"
  sha256 "f44a2d34e7e0384736f4b88d8d8d29ee9142e06e385e6ebd1e9b1d3e4b476f6f"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
