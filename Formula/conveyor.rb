class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.12/conveyor_darwin_amd64.tar.gz"
    sha256 "cc364ccf93375a96ad3840187e83b13f30917000d8db84cb9642956746bdd0b4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.12/conveyor_darwin_arm64.tar.gz"
    sha256 "b30cf7f9554a17d29146ad003603b12a9dd02d36c4cfb2dca1b84807a9c2ec2f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.12/conveyor_linux_amd64.tar.gz"
    sha256 "8e9eadb49866e900b45c00138a795ef346241a6b416e1d19eeb3c2bf506e0eed"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.12/conveyor_linux_arm64.tar.gz"
    sha256 "384f456297459b06fae891cc771c17e2052e91d03f03f1818931d618ab326570"
  end
  version "1.20.12"

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
