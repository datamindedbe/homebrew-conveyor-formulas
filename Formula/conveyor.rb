class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.13/conveyor_darwin_amd64.tar.gz"
    sha256 "54043dc3a36a1a7cdbc4f2ba4794c4f13de5dc06bbe7a9076f782ac432f894ea"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.13/conveyor_darwin_arm64.tar.gz"
    sha256 "8ccf826ecd5e7099930024f4798d73e89794e6c22acc521bea3c24bf7b9f5913"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.13/conveyor_linux_amd64.tar.gz"
    sha256 "783b949bd3806bad5c856b86943dfbb1355d9ea281c52373c1e4deccc74e53bc"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.13/conveyor_linux_arm64.tar.gz"
    sha256 "659dc5a1f14b5b78349669eb0af1c543484a731c89c61071f5ea0b29b16fe20e"
  end
  version "1.16.13"

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
