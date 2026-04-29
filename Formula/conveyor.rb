class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.5/conveyor_darwin_amd64.tar.gz"
    sha256 "2ed62a1e839b92a1944bfde906addc010d0ec82bbe87f97d0c6712ca9797c5b2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.5/conveyor_darwin_arm64.tar.gz"
    sha256 "da0f41513607f6006ea96b24c4f9a44eaaee81a59ab15988ab75409a5cb6007e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.5/conveyor_linux_amd64.tar.gz"
    sha256 "2ac6c898b930ec4b23b15c1e87b160ef92e69f90c6b693c12d7a8ae216cbe610"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.5/conveyor_linux_arm64.tar.gz"
    sha256 "fe084ff95b7758b67b053673b11bb81624a3983ba511256174256fd70d5b8b16"
  end
  version "1.21.5"

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
