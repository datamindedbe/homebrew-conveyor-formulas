class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.5/conveyor_darwin_amd64.tar.gz"
    sha256 "a4b5a64676900872a5d23c5a29505cf308a65db911d13976623c234c9cbd4c19"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.5/conveyor_darwin_arm64.tar.gz"
    sha256 "7d5702ac39dc6b7a61330683941440af3fc7af3095c09252b8f81f175dc350ce"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.5/conveyor_linux_amd64.tar.gz"
    sha256 "b3ec602134801104fe7f6b1f63ecdfb9221d44b3b7a19638567c9d3fc40ea010"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.5/conveyor_linux_arm64.tar.gz"
    sha256 "7cbab7c9455d6b9b58285cf4d92d6166da6901eeb1aefe5ee8cacddf73b3de8a"
  end
  version "1.19.5"

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
