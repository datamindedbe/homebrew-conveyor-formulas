class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.5/conveyor_darwin_amd64.tar.gz"
    sha256 "76d60027b954e22bc32cd0b148311b5a9a654b69cdbbcf193cd94311d6d17096"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.5/conveyor_darwin_arm64.tar.gz"
    sha256 "f265d9aa92625800d3fbe101d7a61584dc1e4522d519722cffd26704a4a02328"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.5/conveyor_linux_amd64.tar.gz"
    sha256 "6281ef3ae112d99eda16b16db743b1e9f7ba35e2d92f582f12213e34b0b0ce4a"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.5/conveyor_linux_arm64.tar.gz"
    sha256 "2749725db0573ca190bc8b3b80cc4d8d3290ba2b5ec1bc1519ec2b2cb7ca6e2e"
  end
  version "1.20.5"

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
