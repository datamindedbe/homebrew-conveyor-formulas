class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.7/conveyor_darwin_amd64.tar.gz"
    sha256 "f5992107818e76bf03f49669800f94edba0250ca5470a963f9b1a9216f09b22c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.7/conveyor_darwin_arm64.tar.gz"
    sha256 "41ff8f0ccbeebc4f7864ae721ac07a358e7ee5eb1d23d3a41c5984da4fae58fc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.7/conveyor_linux_amd64.tar.gz"
    sha256 "c096b17f309e95b455ca4d09845128be453a3ac22d8c389a964ac13bb0cbf65a"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.7/conveyor_linux_arm64.tar.gz"
    sha256 "af471c10a8cbb4b7758d8b5c9e41f3a6dab563410fb5c6e9c7ca7afc37dde5ab"
  end
  version "1.23.7"

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
