class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.7/conveyor_darwin_amd64.tar.gz"
    sha256 "8b4f9b83c176164f115280c178059c4702ebd2aeca56e299cdabb1538973a653"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.7/conveyor_darwin_arm64.tar.gz"
    sha256 "ee15ac81ce1c9b351fbba2844426ab79c644e8408ab40f78273f7fc30bc9a791"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.7/conveyor_linux_amd64.tar.gz"
    sha256 "af0c14f85f3fc07766b86089a9b700993b41e1d85364382b08d48d86e81de36b"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.7/conveyor_linux_arm64.tar.gz"
    sha256 "67274def06d653737758579e128a04ac21019cbb8daf1350cd7daf971f1ef9ae"
  end
  version "1.16.7"

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
