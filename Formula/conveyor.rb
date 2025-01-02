class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.23/conveyor_darwin_amd64.tar.gz"
    sha256 "28ac7ce9a4682f045f00c38215baf86d38ec4e5997262073b89079d002364c09"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.23/conveyor_darwin_arm64.tar.gz"
    sha256 "40bb9c46c05b809f4515a67d5c96bbb6be9bcfd40547b8e3a88ddf80bb2b1cb8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.23/conveyor_linux_amd64.tar.gz"
    sha256 "fa0426b82fac772c5a828e32e6b7ddc0462286dc7476d966408de557abec09c0"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.23/conveyor_linux_arm64.tar.gz"
    sha256 "5430fd0356c78bf5c9210cd81e5bf03fd6741e8815c16848c135222bdf1474a5"
  end
  version "1.18.23"

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
