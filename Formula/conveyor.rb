class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.18/conveyor_darwin_amd64.tar.gz"
    sha256 "a182083b5c734b625b12a170db61306dc639fabfb470a85fc74dff457336df77"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.18/conveyor_darwin_arm64.tar.gz"
    sha256 "3795c0e2336d13b88d9d2d85178103a0ebdb3d1881acd4bfda7c5c34c0b79dee"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.18/conveyor_linux_amd64.tar.gz"
    sha256 "cb0dd9c7d4ea9020f1f7dd93c4f450e2d15b7139d99fe18aa4933d83d03fc4cd"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.18/conveyor_linux_arm64.tar.gz"
    sha256 "67112157ea28d0cf4f4bf3ac7fabe5ac0b0099f72df390bdbb91e53f1101f3a2"
  end
  version "1.18.18"

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
