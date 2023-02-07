class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.5/conveyor_darwin_amd64.tar.gz"
    sha256 "10cee2064affc2a2fb75c0b015524d28370164bcfcfd549bba218a88a9bfa8d8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.8.5/conveyor_darwin_arm64.tar.gz"
    sha256 "d236b415761eae93fdd720f6d83cc69ca9be7f9325aeaa9a3577c0102aff0c72"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.5/conveyor_linux_amd64.tar.gz"
    sha256 "486f2ec1666249e1bb1c79ba2feed127c6ce9c91ab75931268c9460cde3d2a25"
  end
  version "1.8.5"

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
