class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.21.0/datafy_darwin_amd64.tar.gz"
  version "0.21.0"
  sha256 "79c8e42343534a3c5c52f25866e477a96b834dec236790cfdfa2401fd1b13242"

  def install
    bin.install "darwin/amd64/datafy" => "datafy"
  end
end
