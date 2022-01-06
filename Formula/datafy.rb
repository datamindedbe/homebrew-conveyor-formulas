class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.57.1/datafy_darwin_amd64.tar.gz"
    sha256 "ffdf6b40824ceeec531ef06e93112d9e6c0d0254973eb801f571abd2b9c05131"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.57.1/datafy_darwin_arm64.tar.gz"
    sha256 "e4e5644245584664fc72e2171f487485371228715b1336d474f75b9e4d4a66b6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.57.1/datafy_linux_amd64.tar.gz"
    sha256 "33873d3c410577aba0bae6ab0329cba1453db3211f2c47cef87531c2fbd2d85f"
  end
  version "0.57.1"

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
