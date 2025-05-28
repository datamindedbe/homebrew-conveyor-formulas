class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.41/conveyor_darwin_amd64.tar.gz"
    sha256 "08561e7661b7552ce65ecb89a094ca2b75cac4efabd510e5a808a1fe3ff04979"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.41/conveyor_darwin_arm64.tar.gz"
    sha256 "7487f129b5b1c764af1f3963b7b91f742cf9d717915b8edcf8df04fdcd1d74dc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.41/conveyor_linux_amd64.tar.gz"
    sha256 "0893aed8a3bb693afa1f2fe4b784a6ca66d0e6e618cca2b2c6e4d227d0ea5c49"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.41/conveyor_linux_arm64.tar.gz"
    sha256 "16b412eb3fc70cb98e5d1eaecb56986279023b9f9415e9875f8a7245c13a59e7"
  end
  version "1.18.41"

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
