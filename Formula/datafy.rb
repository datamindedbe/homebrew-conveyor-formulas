class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.42.0/datafy_darwin_amd64.tar.gz"
    sha256 "862318ffa4df9fbffd2148cc4169860717efe771ae25373b252a54e8fc4307b9"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.42.0/datafy_linux_amd64.tar.gz"
    sha256 "41c1256c833442ef90182e0ece77b981d3007ddc7cdb7f8ac04ebb4554d2e1bc"
  end
  version "0.42.0"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"datafy").write output
  end
end