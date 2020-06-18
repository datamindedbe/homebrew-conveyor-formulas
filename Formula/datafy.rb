class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.18.1/datafy_darwin_amd64.tar.gz"
  version "0.18.1"
  sha256 "de1d0c0cc15a7800e28124ac70893053b4f205eef03084067dbe511e99e8245c"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
