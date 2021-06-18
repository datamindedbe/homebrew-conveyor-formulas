class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.49.0/datafy_darwin_amd64.tar.gz"
    sha256 "f9176846461a3659b1d14689361f3fb040f0805dec04a11ca2799304db9e5c91"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.49.0/datafy_linux_amd64.tar.gz"
    sha256 "bc7d0e96cdc87b834bd0709d685513c8ed53f80af9fcc702e18128df8069c98c"
  end
  version "0.49.0"

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