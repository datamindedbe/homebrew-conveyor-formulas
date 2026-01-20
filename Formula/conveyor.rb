class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.9/conveyor_darwin_amd64.tar.gz"
    sha256 "f324548a764a87f789801a49ba7a14827e61f1d004377364bdd4417409fc4f20"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.9/conveyor_darwin_arm64.tar.gz"
    sha256 "fd794fde34920534155b303803dfbb116135fbcc59d52c29fc53e117df7fbc8e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.9/conveyor_linux_amd64.tar.gz"
    sha256 "8aa4533eb8cbec7b72f49fd3bc9513ac8bc2be604070b4e20d63e7d1a8386e08"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.9/conveyor_linux_arm64.tar.gz"
    sha256 "228d05d94fd964623447bb997fd196abbc409cd6a4cd7c0c7dd68304a072c564"
  end
  version "1.20.9"

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
