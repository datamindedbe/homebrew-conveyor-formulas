class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.19.0/datafy_darwin_amd64.tar.gz"
  version "0.19.0"
  sha256 "9750ccc5b39b9e373f58d5a9b0ec0ff898ba25e16890cc6fd08ddc92bb7f465f"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
