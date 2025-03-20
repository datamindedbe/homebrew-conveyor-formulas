class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.32/conveyor_darwin_amd64.tar.gz"
    sha256 "4244ed46eb87d2520965211f4b34769b664ccc204eccfddcf44b31ad1b1daf67"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.32/conveyor_darwin_arm64.tar.gz"
    sha256 "8a28eb6a960c1b38487ab6f40e8317d267835198caa75d9c11cf859548869f4f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.32/conveyor_linux_amd64.tar.gz"
    sha256 "4816474b9f4e1f62cd4f52031066f5fd191ea41c2c8bbdafc179c39f374a03cd"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.32/conveyor_linux_arm64.tar.gz"
    sha256 "3bfb87d24ec1f3bfc715ca2dc12d43aef8d89f0b878899a1b7cba7d4357f2e29"
  end
  version "1.18.32"

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
