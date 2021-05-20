class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.3/datafy_darwin_amd64.tar.gz"
    sha256 "5436d746412604ccf89c7133e49952203ee4d91f04e2b7c0951ea01d597ad660"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.3/datafy_linux_amd64.tar.gz"
    sha256 "ce9abdebb15e03333ba2a76470faecd7f69b0b1ed5fac1c118c5bf1df898b235"
  end
  version "0.45.3"

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