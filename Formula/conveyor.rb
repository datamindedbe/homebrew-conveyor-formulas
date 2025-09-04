class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.10/conveyor_darwin_amd64.tar.gz"
    sha256 "8ccebf02fdf7b177fccac7c58bd0d16a828b5c31bc76db49daef23a422d8a60f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.10/conveyor_darwin_arm64.tar.gz"
    sha256 "7734bd346eda8b4f79af327dff3b194ef527f7f100d8362221b9597d0e5fa297"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.10/conveyor_linux_amd64.tar.gz"
    sha256 "da8214dfd5af26c65a9b0a2f1d418c497d6883589017aa636b263918b41fb13f"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.10/conveyor_linux_arm64.tar.gz"
    sha256 "5d9bc2b8a18a05d28f9997af57a91e0de60e62ae213cf44029fc55119c07ad19"
  end
  version "1.19.10"

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
