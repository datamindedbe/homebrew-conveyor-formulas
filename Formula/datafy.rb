class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.47.2/datafy_darwin_amd64.tar.gz"
    sha256 "8e61cfcfdfed907facd7301251f9319b7fc1183eca94e89710f0900ebbf94eb5"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.47.2/datafy_linux_amd64.tar.gz"
    sha256 "10eff8bf36b0772338757bc7120c245320c1a3d79976f02f17dfef0bccee6a40"
  end
  version "0.47.2"

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