class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.14/conveyor_darwin_amd64.tar.gz"
    sha256 "f6ebcd6615256c8d1619dbdd9d68b1bc1890e139e07cf3ea79b3b4a52b98cf98"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.14/conveyor_darwin_arm64.tar.gz"
    sha256 "1a2b1deed6dd5d318c20f2e153da4f6e9e1519db5373cff29e0614366442fb64"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.14/conveyor_linux_amd64.tar.gz"
    sha256 "01d5c3f6632d7ba0d5db463b9120e5e8d1df8ad4e640a0d95e4ca3b2423f6302"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.14/conveyor_linux_arm64.tar.gz"
    sha256 "9f53648dc00658de9413cecefa0589e012d0a73a7caa42aeb1accd2994401bb7"
  end
  version "1.20.14"

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
