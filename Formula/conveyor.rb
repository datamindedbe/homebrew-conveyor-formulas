class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.42/conveyor_darwin_amd64.tar.gz"
    sha256 "9c0669ef4a16cfd994ede42d2511f455331b1fc481ce033076fdc686a65d0d10"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.42/conveyor_darwin_arm64.tar.gz"
    sha256 "a51b39421b43334d9466dfae4f619c104c32fd59e1f23ccd72ad95403a99ab90"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.42/conveyor_linux_amd64.tar.gz"
    sha256 "ade26fa8515dd9780c3dbe60d765eafb727a25d0c68732c8deb696cd0d745fbb"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.42/conveyor_linux_arm64.tar.gz"
    sha256 "288547da18dd95ef7b7c19cf06c83d073bade2b3d8b56ef1f49abbf16af4f831"
  end
  version "1.18.42"

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
