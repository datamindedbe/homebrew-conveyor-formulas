class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.4/conveyor_darwin_amd64.tar.gz"
    sha256 "4bbc11b8e35e008c38d3d0f1c05e2ee4e585f6bb56a43892ab26026bf1516ddf"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.4/conveyor_darwin_arm64.tar.gz"
    sha256 "79a02369983947bfcff27664fd37b14b1a7dfdc0a39ddc05aed12fc79b412c76"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.4/conveyor_linux_amd64.tar.gz"
    sha256 "76556695c652ce8e2521db07af0e92a9599d9bf053ae813d90aac5c19f9f4523"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.4/conveyor_linux_arm64.tar.gz"
    sha256 "aa4598c6d6c907d9c3b0916465dcac3d9b6c8a0ed9eec1ab58e55c0fbfe8bb7a"
  end
  version "1.15.4"

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
