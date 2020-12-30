class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.35.1/datafy_darwin_amd64.tar.gz"
  version "0.35.1"
  sha256 "20f05e43ca9d756369bc2d15a0c98d48f2e565c5d9a08364f0422271ab2efc70"

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
