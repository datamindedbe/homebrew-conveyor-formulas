class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.1/conveyor_darwin_amd64.tar.gz"
    sha256 "c0c4dfb882abc1e49154a3be5e9851d763c7d99f987b0871dcebdbfe20d194b1"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.1/conveyor_darwin_arm64.tar.gz"
    sha256 "5606b080d5e3e1be3d855f7cfd6159399440fc03a02a468d346d3d1b363665ca"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.1/conveyor_linux_amd64.tar.gz"
    sha256 "0e4e391d348dcedf296c37b0e01b0ff6e398cacbbd1febdb9fd7c964fd937c49"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.1/conveyor_linux_arm64.tar.gz"
    sha256 "e25f0dbff3e1d25acd706b04d9983e4ac7d0c2890d4b916237042390782d1e92"
  end
  version "1.16.1"

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
