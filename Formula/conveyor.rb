class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.1/conveyor_darwin_amd64.tar.gz"
    sha256 "9d642c283ba1498a511bfefc589d9b353473a1ecf2039fb6bcdbbc43b1808a4a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.1/conveyor_darwin_arm64.tar.gz"
    sha256 "f9469695eca78a7573a7d1b642f907cf02a20b3f78a1abf1ee53264c4744c21d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.1/conveyor_linux_amd64.tar.gz"
    sha256 "9995bb45c2e2b8192b61a1cf0e146bb109d9d0827248c40ca999fec25a8077e9"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.1/conveyor_linux_arm64.tar.gz"
    sha256 "31daa992693c296de60ceda5716b25dd6e82be491369f20f0becdff48e001a5c"
  end
  version "1.14.1"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read(bin/"conveyor", "completion", "bash")
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read(bin/"conveyor", "completion", "zsh")
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read(bin/"conveyor", "completion", "fish")
    (fish_completion/"conveyor.fish").write output
    (fish_completion/"datafy.fish").write output
  end

  test do
    system bin/"conveyor", "--help"
  end
end
