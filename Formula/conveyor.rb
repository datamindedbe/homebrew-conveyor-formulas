class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.5.9/conveyor_darwin_amd64.tar.gz"
    sha256 "da328c16efedf58f48d6b632dbe6c8c242cb17a498848bf50be02406d26404e9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.5.9/conveyor_darwin_arm64.tar.gz"
    sha256 "6f7f15b02df969cb4da90ca88def4d1aa41a761e3cf3a8239d1bf1bc5653a360"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.5.9/conveyor_linux_amd64.tar.gz"
    sha256 "851d43818772976ba2224b0994a186c19dfbc1137d9b8dd06ad9ff8e8cac77dd"
  end
  version "1.5.9"

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
