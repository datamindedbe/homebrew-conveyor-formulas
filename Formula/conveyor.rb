class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.11/conveyor_darwin_amd64.tar.gz"
    sha256 "71f2d127e815329e752d4ec7ee455d318a648ce4f7eea80121d7dcdda061cf08"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.11/conveyor_darwin_arm64.tar.gz"
    sha256 "7a0b53da937c77835ce9093ac7466639e17010d908b2a471ec505e4640711ac9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.11/conveyor_linux_amd64.tar.gz"
    sha256 "c1efc1167215bf5eb6259d06c40e86cbed8bae60b8804d8255faf4f9113f524d"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.11/conveyor_linux_arm64.tar.gz"
    sha256 "cb2e887eb24ca6266a90980effc0bdba76804a9cec1d165566944b85d132d220"
  end
  version "1.16.11"

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
