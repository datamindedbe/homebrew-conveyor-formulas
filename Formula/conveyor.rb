class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.2/conveyor_darwin_amd64.tar.gz"
    sha256 "68333af4c7d116dd3dc674d4a7d7ffbb3e500cd609a9584937c2ebc6641346c0"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.2/conveyor_darwin_arm64.tar.gz"
    sha256 "3cb2ebd41830002e44f712a9588a6479430961f15fdf06926f927c6f1c8f49b2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.2/conveyor_linux_amd64.tar.gz"
    sha256 "fc0544c295e6a329b067743a7d9cbc713bd3b4acf3b61592a632a19899a4f20b"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.2/conveyor_linux_arm64.tar.gz"
    sha256 "709e26d6c2feeb6d7f1b2679d8a9f8a66487abc91b7683496f9de5aaf3777a66"
  end
  version "1.15.2"

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
