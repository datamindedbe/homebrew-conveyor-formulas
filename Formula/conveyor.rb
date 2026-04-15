class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.3/conveyor_darwin_amd64.tar.gz"
    sha256 "aabfc0cd69c0474d4e327cd860308c66d5d5a959855406767a2d6d22313e8331"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.3/conveyor_darwin_arm64.tar.gz"
    sha256 "7e3603f288cba89b822e7dcaaefc8c4f23f7728b7f7f9566c7196f7fa044396e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.3/conveyor_linux_amd64.tar.gz"
    sha256 "2c795be5fde502e2249a3cf0dcc52cc208bafd87f2f38f5a84f4084b1c2f7f48"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.3/conveyor_linux_arm64.tar.gz"
    sha256 "042cc3106dfb2d9aabf9cfb31c4e6f0565b2f441aa9423d102cafa2ddab68e80"
  end
  version "1.21.3"

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
