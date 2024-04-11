class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.7/conveyor_darwin_amd64.tar.gz"
    sha256 "5c8b2d8055f5384ea231b83555adb473fe371f66f56d8b1d897cb1ab8d3eab63"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.7/conveyor_darwin_arm64.tar.gz"
    sha256 "1616752a048b716b1b8bf8e8571125caf071989ca4f5b9945da9424f1bbd3701"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.7/conveyor_linux_amd64.tar.gz"
    sha256 "4a7243174a68a19161549df82f65885e76bca0c31d035cb72657fa4b0e416cf4"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.7/conveyor_linux_arm64.tar.gz"
    sha256 "bbfdd10e1fca7f4cffdd42e1735a547967329519ae355e451916bf5e75e44b84"
  end
  version "1.15.7"

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
