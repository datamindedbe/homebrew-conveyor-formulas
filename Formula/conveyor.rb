class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.22/conveyor_darwin_amd64.tar.gz"
    sha256 "3e58aa132fc653d641ed80237dacccc2ce663858a06a51a09fe11c8ab7267a80"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.22/conveyor_darwin_arm64.tar.gz"
    sha256 "2f3f17e9c910fc4deb6b661000f243b0472c06ec3c2ff3949251e04fe1b514db"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.22/conveyor_linux_amd64.tar.gz"
    sha256 "8b9f5c49fa316e5df6064e040f04e8666842494e65893e1452b61c18b3737536"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.22/conveyor_linux_arm64.tar.gz"
    sha256 "08beabd4b1a4e12d7dd89d99250a81c6466426d59869820c3564f9b62363f2cb"
  end
  version "1.18.22"

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
