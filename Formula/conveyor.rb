class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.7/conveyor_darwin_amd64.tar.gz"
    sha256 "0b818d6b7027e687235a41e6b3e584b279b0fc7e919c83d4566260444c45dac8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.7/conveyor_darwin_arm64.tar.gz"
    sha256 "ced41dfb224fd37c2d02b4d252acab5859b2fc7216eadac2f75046316b700e10"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.7/conveyor_linux_amd64.tar.gz"
    sha256 "b1ad42b61e91f07a26b1844f01ba0711ef9d1b0664da1d9bea81eee07cfa4f77"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.7/conveyor_linux_arm64.tar.gz"
    sha256 "866abd5f20af14833733bbe35793bc2636183195ec06a5edbd8218411ccbc584"
  end
  version "1.14.7"

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
