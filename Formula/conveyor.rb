class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.2/conveyor_darwin_amd64.tar.gz"
    sha256 "fc59a819a4b1506683abf2446a414140bcae14173a2de3b7f06467f68ea444a2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.2/conveyor_darwin_arm64.tar.gz"
    sha256 "7485c73b7c0c6bcac4414de9efac599f81991efb981ba4f7b62d54a687be8ea6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.2/conveyor_linux_amd64.tar.gz"
    sha256 "d30f05ebb39c60861fc9a85ee774b578a287e6035a3362ac12584ebd4fe07aa4"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.2/conveyor_linux_arm64.tar.gz"
    sha256 "f3423fb4e6c5e28a58f01447d1df9efe660c8c8895c1fd77c07926ac4fda70be"
  end
  version "1.19.2"

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
