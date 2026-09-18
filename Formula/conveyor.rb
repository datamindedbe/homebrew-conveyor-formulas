class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.1/conveyor_darwin_amd64.tar.gz"
    sha256 "32f68e53fc5215994b63260d5958ec8315438022b022a47bb838edad6f53e407"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.1/conveyor_darwin_arm64.tar.gz"
    sha256 "6fc19f763713c72f1b97b0b88dd0246303d6db139ba941cf5320a45028567a42"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.1/conveyor_linux_amd64.tar.gz"
    sha256 "256c95747e8b41d0ceb5958318883c68d1544f14fedee4f72c375debfb74bd95"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.1/conveyor_linux_arm64.tar.gz"
    sha256 "8e7aca309868a7670b55580f156ce6c886dc89400e71d105c247862045c232cf"
  end
  version "1.23.1"

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
