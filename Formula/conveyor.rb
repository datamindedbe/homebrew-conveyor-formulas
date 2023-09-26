class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.15/conveyor_darwin_amd64.tar.gz"
    sha256 "da7a34276d670a89d3db03e6f45ff5debaad553b2f2ccd602987c3ea7ba459ff"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.15/conveyor_darwin_arm64.tar.gz"
    sha256 "6ec41db7bf9709d5be4991adefe1ef6b8a9cb24b837bddba515486fcce488f53"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.15/conveyor_linux_amd64.tar.gz"
    sha256 "996c5191087a7462093ef619ee4a8bbb02f7f87accbb451a05e499bee1f37ccc"
  end
  version "1.11.15"

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
