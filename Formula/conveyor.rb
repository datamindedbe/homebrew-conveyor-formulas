class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.5/conveyor_darwin_amd64.tar.gz"
    sha256 "46d3368e0a71b42f1b713dee85cf3bb83e70e13f166a3f889082f602784c7925"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.5/conveyor_darwin_arm64.tar.gz"
    sha256 "147d7d084d2074a005613af7ae761c0266ec6c664f27d92753de33def47ac9d7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.5/conveyor_linux_amd64.tar.gz"
    sha256 "8e927448fda9736a45e48dcdd391420ecc9a0de5ad2ba8b5299a8bab855c9852"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.5/conveyor_linux_arm64.tar.gz"
    sha256 "ca79c29dd953c5ba8880c6d93c3346eb26c6d4d8dabeb075909d16e7ac7c3f56"
  end
  version "1.15.5"

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
