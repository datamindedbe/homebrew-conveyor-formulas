class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.8/conveyor_darwin_amd64.tar.gz"
    sha256 "3f48fc96a601e857c69db443a5867c8c32fe87bd6f98d62e20473f94fcf18f94"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.8/conveyor_darwin_arm64.tar.gz"
    sha256 "df886a272fe7e7df41414fa0dddaff3aac41a32a13a75f106f5dc3242fd039ef"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.8/conveyor_linux_amd64.tar.gz"
    sha256 "4b5f318a9865e36656740f3bbbdcfa9935288786c3ab8c19051d7fcfdc81c464"
  end
  version "1.11.8"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "bash", { :err => :out })
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "zsh", { :err => :out })
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "fish", { :err => :out })
    (fish_completion/"conveyor.fish").write output
    (zsh_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/conveyor", "--help"
  end
end
