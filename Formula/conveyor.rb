class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.4/conveyor_darwin_amd64.tar.gz"
    sha256 "073fe647737077f5a29c3508b6bb08b86c8901e1e0d226fa1f80d99d46170c9a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.4/conveyor_darwin_arm64.tar.gz"
    sha256 "777d1b682c071378bd4bb48e855d8424a3975ff47ebde5489aea2f533ecb5fb5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.4/conveyor_linux_amd64.tar.gz"
    sha256 "55684914022a077395ea0d38c87035e9415991d966efb5ce165cf908528d43d2"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.4/conveyor_linux_arm64.tar.gz"
    sha256 "fec0388d3dc6d534bd506fd8206e51ca098fd5f6bdfab1e9422ffebb0724596c"
  end
  version "1.14.4"

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
