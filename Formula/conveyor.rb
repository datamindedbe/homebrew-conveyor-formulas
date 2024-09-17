class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.6/conveyor_darwin_amd64.tar.gz"
    sha256 "24eb078c46006013500dfe59059d58273eb37aa26ce9e418bbab51afd25b3d68"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.6/conveyor_darwin_arm64.tar.gz"
    sha256 "c2ccc7113b921fb311d7153d2d4049f4bda8a5d22139a178b749f3cf33517651"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.6/conveyor_linux_amd64.tar.gz"
    sha256 "f1674afec07029cd24ce7887d4f503456ae0895b9680835391663af7bb5db935"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.6/conveyor_linux_arm64.tar.gz"
    sha256 "236803776cc115448365af720c9b24a2e5fd19201680c712f2824791782d0e68"
  end
  version "1.18.6"

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
