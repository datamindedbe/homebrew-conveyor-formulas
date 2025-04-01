class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.34/conveyor_darwin_amd64.tar.gz"
    sha256 "788780dff117c34ff9725123be60e96526cfbc6128f983806a5533ab2d900008"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.34/conveyor_darwin_arm64.tar.gz"
    sha256 "d9bcf18ab4f5f0c5dbd03b5adb892e576725f557e6a20d89e905a142fc1c3c9a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.34/conveyor_linux_amd64.tar.gz"
    sha256 "40a97ea90dd7fd61b3d0da11714f9a7b3787dda53cbee75197533441fef9b27f"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.34/conveyor_linux_arm64.tar.gz"
    sha256 "d683beee3621e8f2ed3f14fce83a8362ca14a4a5c0b8b1820da73f80367f52df"
  end
  version "1.18.34"

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
