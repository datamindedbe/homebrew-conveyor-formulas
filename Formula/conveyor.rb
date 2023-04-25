class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.10/conveyor_darwin_amd64.tar.gz"
    sha256 "3cd3c35712e3f476eacb66afcf54e6cb1f2094e676982b6ecd457081a9d19fbf"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.10.10/conveyor_darwin_arm64.tar.gz"
    sha256 "0426987de88cd212f04085ef43affaa6758aba51f7e420ac4c7ee629e688914c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.10/conveyor_linux_amd64.tar.gz"
    sha256 "a33c35694c398dbce0cd106cc75d693d16b3156f8eadc074145375134e7d0cdf"
  end
  version "1.10.10"

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
