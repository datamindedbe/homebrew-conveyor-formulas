class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.12.0/datafy_darwin_amd64.tar.gz"
  version "0.12.0"
  sha256 "d1647e75702c51f0aa8800ab299b52ecee19265fdf80e2d1e538540b990a885d"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
