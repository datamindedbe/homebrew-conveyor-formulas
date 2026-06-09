class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.5/conveyor_darwin_amd64.tar.gz"
    sha256 "a464907d79d2be2ed6c0a41996199eb39d679d53feb6d2f831a4459e4f075891"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.5/conveyor_darwin_arm64.tar.gz"
    sha256 "5057026bae0e70593ff44aa38da2da58134fc5d8f5da50f8d432e95657891b28"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.5/conveyor_linux_amd64.tar.gz"
    sha256 "26d3d8c78c9847ede3d3e9e9d7f3dcf3250ca95cf48e86871bdd182fd077f750"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.5/conveyor_linux_arm64.tar.gz"
    sha256 "07871bb699274182f24fce0be349225ad810cf17f99207ab23b30f9f146f4b14"
  end
  version "1.22.5"

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
