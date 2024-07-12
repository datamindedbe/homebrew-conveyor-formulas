class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.14/conveyor_darwin_amd64.tar.gz"
    sha256 "0c037d3a98090c22a3d52d0e09b194551d80c38602bde8c3b67f6cb5f4daa5bd"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.14/conveyor_darwin_arm64.tar.gz"
    sha256 "3a7217d99155c11c547820e8a849f8cdde57724fd6cc9623fae37ff648b4d87a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.14/conveyor_linux_amd64.tar.gz"
    sha256 "4f80b9659076611d8f2ecde98ba6f85dfddf8c5d65e4f2487ae5d47608ee19bf"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.14/conveyor_linux_arm64.tar.gz"
    sha256 "98104cec040520d23145bfddcc5798e0c26f794c889cde6618fc99252b9d0914"
  end
  version "1.16.14"

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
