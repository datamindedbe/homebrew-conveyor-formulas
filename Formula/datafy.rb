class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.4/datafy_darwin_amd64.tar.gz"
    sha256 "c797642b0c998e8471733f499b04b1b76f908814a6477cebc49e14fa3f08d18c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.4/datafy_darwin_arm64.tar.gz"
    sha256 "3441a95141b0aeed5d94ac2f274bc37e30e305b3012ea013919ecf751d0f0aa3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.4/datafy_linux_amd64.tar.gz"
    sha256 "22498bb3d63439f05a01ad5a6b1ac0dac86e8c303cc4a3ebf0d395fe5f891ebd"
  end
  version "0.61.4"

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
