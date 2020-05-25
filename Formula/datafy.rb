class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.17.0/datafy_darwin_amd64.tar.gz"
  version "0.17.0"
  sha256 "e94fa84ca4d45bcc89c17ccbef332a3d8305dcf77bc7658503257ee3491d8115"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
