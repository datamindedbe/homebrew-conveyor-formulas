class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.20/conveyor_darwin_amd64.tar.gz"
    sha256 "7955e2cbea6ded7828bb5f63bdc18ebc6c7822c641dd74750193d7a275a41637"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.20/conveyor_darwin_arm64.tar.gz"
    sha256 "d870c42b7afef5cc259fa65b8f1a9a6846c342e6a46dd3d8fb8f7f7c438e8fef"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.20/conveyor_linux_amd64.tar.gz"
    sha256 "c81ef2efa68b02cda85c2cda68b19946a005d982450f48102a76120e47389bbd"
  end
  version "1.11.20"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "bash", { :err => :out })
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "zsh", { :err => :out })
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "fish", { :err => :out })
    (fish_completion/"conveyor.fish").write output
    (zsh_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/conveyor", "--help"
  end
end
