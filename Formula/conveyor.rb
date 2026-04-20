class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.4/conveyor_darwin_amd64.tar.gz"
    sha256 "f0ee887807912eb711832e5738aa86893523354de6e64c8d0b4a46876d2ed2bd"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.4/conveyor_darwin_arm64.tar.gz"
    sha256 "c4a27350e8f09a8519f81de8fa74d4794552f1fe90aa0b6003aeadfcc31189a6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.4/conveyor_linux_amd64.tar.gz"
    sha256 "15cce15dcdd3ca2f5b48415368253fae4ed0dbb2fabb1ca6ad36378d35357bb5"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.4/conveyor_linux_arm64.tar.gz"
    sha256 "ec5d5c92c31a574ea868164ed93ae04f878b1fdfe386fe0172983307a4cff8f6"
  end
  version "1.21.4"

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
