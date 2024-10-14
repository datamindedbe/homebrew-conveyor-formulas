class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.10/conveyor_darwin_amd64.tar.gz"
    sha256 "5054308df521f2e0562a2d46a70b50587c24d3d9a268d36ff987d7bd8b9d190c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.10/conveyor_darwin_arm64.tar.gz"
    sha256 "232b5f179c1af2c1a6d79d20d6ba15df427f564df4f2574cd82c4fcadba4ed1b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.10/conveyor_linux_amd64.tar.gz"
    sha256 "a1085c7b8e807e37150cb22b6aaef22051bdfcc4621d95ac5fc03e106ed6194e"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.10/conveyor_linux_arm64.tar.gz"
    sha256 "40e036299fa001a2b82a9ec862a5903166465e1ed75ee2a5da68ddb3f45adb51"
  end
  version "1.18.10"

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
