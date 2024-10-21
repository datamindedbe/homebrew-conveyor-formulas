class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.11/conveyor_darwin_amd64.tar.gz"
    sha256 "a10b5749d6385f2118cdd88088c4c995d64cd82fd3cefa3b4a12a88f064cab3a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.11/conveyor_darwin_arm64.tar.gz"
    sha256 "18bb08af1fb4c872057994560e0fcf5151cd6a9542de8727150b9fa574726e38"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.11/conveyor_linux_amd64.tar.gz"
    sha256 "0eea9487f5e6f9e375d983534d8e4979d8479c05721e0944fd21d01379d81905"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.11/conveyor_linux_arm64.tar.gz"
    sha256 "63d935b9d77ffb6acfc6a24796de89fd9a950d1f7eb0ae410227da288804e9ec"
  end
  version "1.18.11"

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
