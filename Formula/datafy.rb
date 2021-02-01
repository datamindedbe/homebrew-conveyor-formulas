class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.37.0/datafy_darwin_amd64.tar.gz"
  version "0.37.0"
  sha256 "1c901762769127d90030e48e5455e9659bc0527592f52598419379d79812e64d"

  def install
    bin.install "darwin/amd64/datafy" => "datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"_datafy").write output
  end
end
