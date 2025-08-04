class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.6/conveyor_darwin_amd64.tar.gz"
    sha256 "77697888f4934b1b8771d3cbb9e205facd71d4ab9abaf31a2e4d6e7823a6eab4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.6/conveyor_darwin_arm64.tar.gz"
    sha256 "6144fc3c74adb069ed0a1867bc8531f1b1d8aa94d2756c433d162c51af0ac669"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.6/conveyor_linux_amd64.tar.gz"
    sha256 "e016d5d751bdab546a622438412dac336891aa53caf7b416296d5a29e7078a97"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.6/conveyor_linux_arm64.tar.gz"
    sha256 "fbb4ff0dd932c9ddd50d4b39c8aed7dfdce5a5e3e9c83469a659890a55fbf9fe"
  end
  version "1.19.6"

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
