class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.6.0/conveyor_darwin_amd64.tar.gz"
    sha256 "fb3347fff08ba05cc9fe3312e34ea0f4d851bfd9053d35c84351dc1fa395bdcc"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.6.0/conveyor_darwin_arm64.tar.gz"
    sha256 "fae9b430a0d5f61a572e4b88aa42cb669b2aa1c123b9cc493425426ef154ff0c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.6.0/conveyor_linux_amd64.tar.gz"
    sha256 "14d0ca7c0b61c76b28347ffcc989c250856d6f19b609e9bfa13486e10ddc0bd6"
  end
  version "1.6.0"

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
