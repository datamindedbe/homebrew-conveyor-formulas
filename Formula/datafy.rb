class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.57.0/datafy_darwin_amd64.tar.gz"
    sha256 "7dec2762dc87bd8e7914e0291dfa85d68706a4be409b52a9044ef1f788e27bca"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.57.0/datafy_darwin_arm64.tar.gz"
    sha256 "b47df340e509fb490ed350b8e31da6439f6027a80ce826f91a96169e77403496"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.57.0/datafy_linux_amd64.tar.gz"
    sha256 "5bf4d0e7ead4bd60a47dae7a32ebc8805af2cc7798c13e979483876cd11436c8"
  end
  version "0.57.0"

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
