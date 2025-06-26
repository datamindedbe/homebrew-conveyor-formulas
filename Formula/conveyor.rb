class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.44/conveyor_darwin_amd64.tar.gz"
    sha256 "68cac27ea6e9e407a75a360b46f55257a2a30d439b98402aaeba582ffd495bde"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.44/conveyor_darwin_arm64.tar.gz"
    sha256 "9dfa23eeb58eff06586fd778d2b9e6cd71148f27521d984074146c6b6290b934"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.44/conveyor_linux_amd64.tar.gz"
    sha256 "851d993bd8171450ba607fe6736fe42d573a4d2e2bb2bf00c6fc1b3d8708097a"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.44/conveyor_linux_arm64.tar.gz"
    sha256 "38259b1a16a2a0143bdcfd93561f6b69f5de2e83c71f17ebaab4f4813aeffcd0"
  end
  version "1.18.44"

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
