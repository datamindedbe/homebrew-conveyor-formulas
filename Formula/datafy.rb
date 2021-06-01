class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.47.0/datafy_darwin_amd64.tar.gz"
    sha256 "eac3f116ffd99d0f3badbe3c98c5b40ad583b0d6fe77c89fbaf6667f9101c29d"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.47.0/datafy_linux_amd64.tar.gz"
    sha256 "5c4d331d6f2ee97e0d32bef2af4d4749946f71b99e774c038c11c70d928507a2"
  end
  version "0.47.0"

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