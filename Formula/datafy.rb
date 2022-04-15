class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.5/datafy_darwin_amd64.tar.gz"
    sha256 "c4a2db41f293e72c53458d48ae2cb304ddc35de677b077f7c6c112edb878710f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.5/datafy_darwin_arm64.tar.gz"
    sha256 "8cf08042252bc96c9aba63cc8e4a1e70f80f339166646bc414285bb274599659"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.5/datafy_linux_amd64.tar.gz"
    sha256 "aa9c40b0e72b18a6c6db84d3b00d507763d50889b0eb1b1d2d05d7ab01a7173b"
  end
  version "0.62.5"

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
