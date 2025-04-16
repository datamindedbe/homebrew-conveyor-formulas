class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.35/conveyor_darwin_amd64.tar.gz"
    sha256 "d42421cfdef5ca4271175d70cd8fc3d9f369409463edc21bb09c1ff38c0de06c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.35/conveyor_darwin_arm64.tar.gz"
    sha256 "a3195407cd2f6427d028ced0129c84c375e9fb98d96dadb236d589f3a3d0c94c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.35/conveyor_linux_amd64.tar.gz"
    sha256 "019b50b0341954b35ec20a2d5bc5080f61491eff1b98961629e5299cc31d00c7"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.35/conveyor_linux_arm64.tar.gz"
    sha256 "cb9443942739261490fef42ab9e01825ea14d8ad003dcd810f3a5b21dc85f5ff"
  end
  version "1.18.35"

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
