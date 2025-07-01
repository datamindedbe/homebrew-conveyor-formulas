class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.45/conveyor_darwin_amd64.tar.gz"
    sha256 "bf867e91bb603784b6b3dffc6a2f791e6be994fb8c0109a7deb2852398e17b81"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.45/conveyor_darwin_arm64.tar.gz"
    sha256 "bcbcfd6d217738ac56d38e165042b319341738a43248045a7571cc069b88cf48"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.45/conveyor_linux_amd64.tar.gz"
    sha256 "4878ee017972315941d49ada7f019bb98291825ed04a973fec1057f899bb7bb7"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.45/conveyor_linux_arm64.tar.gz"
    sha256 "6417f813bd9c91f10ac3186dfea8e63af1593f6d013d7f01e9846139855a75e3"
  end
  version "1.18.45"

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
