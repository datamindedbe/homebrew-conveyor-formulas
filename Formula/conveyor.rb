class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.7/conveyor_darwin_amd64.tar.gz"
    sha256 "9ee4b8bafdf59a9961c70922daa25017c13757deb23d0e93bbaacfdd3b674fd8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.7/conveyor_darwin_arm64.tar.gz"
    sha256 "d75367e4865c114480f2b9804982ccb6c9b847dc2baec2f6b072b08bf0525edf"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.7/conveyor_linux_amd64.tar.gz"
    sha256 "a4cc40db355431fc31d51919e6e2e6906e2049afa3b783e5ffea5c3494126129"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.7/conveyor_linux_arm64.tar.gz"
    sha256 "152251b9e8725c4d36251884567cd76c7d57ae3e081ae3bda0d6d39f358d88af"
  end
  version "1.21.7"

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
