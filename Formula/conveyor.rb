class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.10/conveyor_darwin_amd64.tar.gz"
    sha256 "349bf094f065c687f6ce13d16f45c3bd3442a42e33c8c6c4e291cf2ff2e09e6a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.10/conveyor_darwin_arm64.tar.gz"
    sha256 "d21d2c26bb8b427eb27a2cb374911e3788e483e1927b4556d55a8ee0e6ec2656"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.10/conveyor_linux_amd64.tar.gz"
    sha256 "4fbfe08fb47d2877badbc0be055977bcf76e078ba3fc7f86787462da9038eed9"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.10/conveyor_linux_arm64.tar.gz"
    sha256 "7ae314026077fd060e320a4a2ef08993f5acd3632b0398c1bf2408f3a9e6f07f"
  end
  version "1.17.10"

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
