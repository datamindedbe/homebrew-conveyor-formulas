class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.18.1/datafy_darwin_amd64.tar.gz"
  version "0.18.1"
  sha256 "2cb5e56a5fa795e24c75b079286966507af003d4b0850b0aba2d4918531cb0df"

  def install
    bin.install "darwin/amd64/datafy" => "godatafy"
  end
end
