class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.2/datafy_darwin_amd64.tar.gz"
    sha256 "f3e0cdac848af802bd19d93f30acd9bbc8dd34349ffe533b1c7881286edd40e6"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.2/datafy_linux_amd64.tar.gz"
    sha256 "44b5c7c0be1d43b32539a57b62502cbe66a1ef6bf28ff471f4a914797b9ce0ad"
  end
  version "0.44.2"

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