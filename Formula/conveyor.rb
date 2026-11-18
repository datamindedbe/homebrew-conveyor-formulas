class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.24.0/conveyor_darwin_amd64.tar.gz"
    sha256 "ab2c7e22fd95d8aad993b2500d4dd3a2de2c3b653c6f950fbb35db2b01d92dfe"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.24.0/conveyor_darwin_arm64.tar.gz"
    sha256 "8a425c9f6d5e09424874c2fc504973b2b85eec0481e467bf4b21125ec550813e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.24.0/conveyor_linux_amd64.tar.gz"
    sha256 "3aabacff61e94a5b692041f16a6b6b2831c3e29fbdeec949dc0a8dd3caf48502"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.24.0/conveyor_linux_arm64.tar.gz"
    sha256 "2b7bec2f818ec0cc1e023e2c372836006be389f876515a779b0105f248075151"
  end
  version "1.24.0"

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
