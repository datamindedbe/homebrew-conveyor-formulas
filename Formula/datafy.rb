class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.0/datafy_darwin_amd64.tar.gz"
    sha256 "0d55a635f6ea25b3ed6fb67c341825970941c04be513d72c31223ce17dfe922b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.0/datafy_darwin_arm64.tar.gz"
    sha256 "0830c2207cd70f31d19d4886fff06c022616581a25e2ab2860bc361708302edc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.0/datafy_linux_amd64.tar.gz"
    sha256 "c2157239d801addaf5db9a65cb1ae60dd6021cacfbceb028c61ea097dcf50f25"
  end
  version "0.61.0"

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
