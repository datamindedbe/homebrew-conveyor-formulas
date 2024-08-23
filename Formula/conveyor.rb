class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.2/conveyor_darwin_amd64.tar.gz"
    sha256 "d0ec1b0e09e59c57cbf57ea4b5197fd0f58c9a0eaf4c3c8186c0e5486a542ba3"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.2/conveyor_darwin_arm64.tar.gz"
    sha256 "d379d15d7e68f051833dc61224ca496d8db1cf1937323194ee457481c44d4fb8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.2/conveyor_linux_amd64.tar.gz"
    sha256 "b3547000b5b6f7f925731fb319536e5d0b5c90bc35fb7936808ab61823bbbe83"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.2/conveyor_linux_arm64.tar.gz"
    sha256 "8e4f1d61a3e85b5999add8ba80a852714bf15d2aecc8878494c85c68e28a18fc"
  end
  version "1.18.2"

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
