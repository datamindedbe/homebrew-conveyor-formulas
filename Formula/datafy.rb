class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.29.0/datafy_darwin_amd64.tar.gz"
  version "0.29.0"
  sha256 "15429b87ca2c569bfba4038c4ad17085245652196cf0ba7d67bbf1d010c07ac2"

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
