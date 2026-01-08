class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.7/conveyor_darwin_amd64.tar.gz"
    sha256 "7b893204695ac20794347ae5f1dba9d4f6f9bf04f5804023a51a7adb4c5640d4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.7/conveyor_darwin_arm64.tar.gz"
    sha256 "0169e3419fbd41ab5b355e8cd9edd91d5f52c0c4fa57ddf70c24a2f2e8d4c1b9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.7/conveyor_linux_amd64.tar.gz"
    sha256 "46477a98b8581d16ad899210850c74ef838837672e4b265ac62c70a7e3752ad0"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.7/conveyor_linux_arm64.tar.gz"
    sha256 "af7fd711a265e852421e66dcac4f9d67c77be236e92e65f701d91c5066ffc0ec"
  end
  version "1.20.7"

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
