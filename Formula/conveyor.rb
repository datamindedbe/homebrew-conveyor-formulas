class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.0/conveyor_darwin_amd64.tar.gz"
    sha256 "2c03871698c96d8c37ac7aaba8eb1e01079f93110dd1121b663b42a0ae7cf1e8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.0/conveyor_darwin_arm64.tar.gz"
    sha256 "71f7565801e986ecea7bd5681f2f4a44d3b357115e680fb76736c1864348d336"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.0/conveyor_linux_amd64.tar.gz"
    sha256 "77602535c356d7d6000aa30325eb860e75d8398f84775e1e56d23e23696bf9cd"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.0/conveyor_linux_arm64.tar.gz"
    sha256 "583a19b9b4a21c3bb79c11fc4f9e0d2549362e2f4297bbebc4ffedab1a067776"
  end
  version "1.19.0"

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
