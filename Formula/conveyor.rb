class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.13.0/conveyor_darwin_amd64.tar.gz"
    sha256 "7bf92fc819bd3351f6fd0ba6104838bdfebb73a0d1ff62326f0ea3b3dfad5e07"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.13.0/conveyor_darwin_arm64.tar.gz"
    sha256 "b9a0c4f801e02acbb5a7c8ba3fe8c78024f79473bf2ccd23b981be8f2e4ada46"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.13.0/conveyor_linux_amd64.tar.gz"
    sha256 "e7c82ae59b2c459ef2db27650f35611279d0cd799ce76a42fd75ff5fbf018bf7"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.13.0/conveyor_linux_arm64.tar.gz"
    sha256 "bcdd4c74bdc7cd4a07a517955973035c3bf28ae8faa482b261692b9c6b121137"
  end
  version "1.13.0"

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
