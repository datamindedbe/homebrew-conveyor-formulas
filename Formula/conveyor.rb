class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.24.1/conveyor_darwin_amd64.tar.gz"
    sha256 "dda0c35df85e547de6bee88579f6fcaa559128b4df6e81f45cbc412ee4524b90"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.24.1/conveyor_darwin_arm64.tar.gz"
    sha256 "19a280d3b489139a2d8556f7b38b5d05493e295d29a5f80616242c475366fb78"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.24.1/conveyor_linux_amd64.tar.gz"
    sha256 "08e573222070c2904ecf5c9df34a6feb7e3355159140a492035ecffb2e0a815e"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.24.1/conveyor_linux_arm64.tar.gz"
    sha256 "1344727465cdb70a0ce8ed9291a35e86aa043ef954cbe505b0611513bbffacc2"
  end
  version "1.24.1"

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
