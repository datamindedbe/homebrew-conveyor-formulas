class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.2/datafy_darwin_amd64.tar.gz"
    sha256 "fe548a4d5f79dd078499533d035ee3872b8056217d493def4d853032e094b8bb"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.2/datafy_linux_amd64.tar.gz"
    sha256 "9113c698507bec3e3446dbeb55ee8808e0658c85c47039099781429c992ab84b"
  end
  version "0.45.2"

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