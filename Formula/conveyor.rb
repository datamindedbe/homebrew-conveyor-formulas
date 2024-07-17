class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.5/conveyor_darwin_amd64.tar.gz"
    sha256 "768d0511148c822700a758d44610b1eecebd253b726259ba9b550e614f56063d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.5/conveyor_darwin_arm64.tar.gz"
    sha256 "d9e9f268743c925f852fd094a6525dba0715cafe7dc883c9164b2d7094f56d13"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.5/conveyor_linux_amd64.tar.gz"
    sha256 "50b36e2a9aa1ac23897142b3b75fb5e7b0a48d8cafb674bea08ff8ec2817f562"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.5/conveyor_linux_arm64.tar.gz"
    sha256 "f92bd7d927a39630aff348eb7437b8fbc5022e93d35751e8272024e16c892e73"
  end
  version "1.17.5"

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
