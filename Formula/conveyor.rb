class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.6/conveyor_darwin_amd64.tar.gz"
    sha256 "7876e5a67f79eae64971ebafa50ef1f27e5b666f97e5705aabe56fd1b5f98159"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.6/conveyor_darwin_arm64.tar.gz"
    sha256 "7d5fca2200389e2e73a4bd8e389b04f5705ef68749f42609098df080c5fdf148"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.6/conveyor_linux_amd64.tar.gz"
    sha256 "fcfebcfce970ab2b11bf2624a323de1d25c41fc0d118f672dcc3b69d29df6487"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.6/conveyor_linux_arm64.tar.gz"
    sha256 "74be45fce710eda1fc38d6452f095b653e16e5623294104aac9787a097bd45eb"
  end
  version "1.20.6"

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
