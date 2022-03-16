class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.1/datafy_darwin_amd64.tar.gz"
    sha256 "651532b84a9c0939e4eb48ed1dac0488b87c9feb2c6ebb6f2ebcd4d201783319"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.1/datafy_darwin_arm64.tar.gz"
    sha256 "1c174215c6f5872b6d3a8d16fa862777ceb49f370e49ba78fe9be34b19ecd9e9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.1/datafy_linux_amd64.tar.gz"
    sha256 "129555ef9a0a6ef36b860198cd546556c7c244e063b9335db63076884dc46ec8"
  end
  version "0.61.1"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "fish", { :err => :out })
    (fish_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/datafy", "--help"
  end
end
