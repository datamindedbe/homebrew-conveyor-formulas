class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.5/conveyor_darwin_amd64.tar.gz"
    sha256 "1fe602122dd5ad4d06502da2a7288a85199b7759566466a7ef7b65716f2aba5a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.5/conveyor_darwin_arm64.tar.gz"
    sha256 "d2f35f01af1da9f51cc5d7b0a64a2493ea6c50de05eb350b914cae8724fee9a7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.5/conveyor_linux_amd64.tar.gz"
    sha256 "65cc2784cdd28d233de88e9f43f684bd2f2d7d138b7f912893a4bc53f898c777"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.5/conveyor_linux_arm64.tar.gz"
    sha256 "16e24cbea92b40a4321159246861d4b5cfa822527f6fc54b46f288ffc7836912"
  end
  version "1.18.5"

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
