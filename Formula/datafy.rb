class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.48.0/datafy_darwin_amd64.tar.gz"
    sha256 "7fa4008330a799d020e4ae6420aa66741a480e949e8ddf3cc79fa16ade46b4bb"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.48.0/datafy_linux_amd64.tar.gz"
    sha256 "67ca271c217dece6d5418ecc3d9e428dd9017396a5fb3ae952acb836b8987521"
  end
  version "0.48.0"

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