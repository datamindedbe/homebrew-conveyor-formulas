class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.6/conveyor_darwin_amd64.tar.gz"
    sha256 "4ad2359be15d4ea9defcc69702e37f5e958128f85179afc24a5adba4696a260a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.6/conveyor_darwin_arm64.tar.gz"
    sha256 "ab4b009ef52364be8989f6d21580f637b93ab471f6618623e05d126a85e10f4b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.6/conveyor_linux_amd64.tar.gz"
    sha256 "0c22bcb3415a34e0be2403d586f78c6a1ba4f0094bd73a0e34abe493028e28fe"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.6/conveyor_linux_arm64.tar.gz"
    sha256 "2391aae8079a0bbb250d5e50ff9f49f7efa603be670d032c805369968d8329c0"
  end
  version "1.16.6"

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
