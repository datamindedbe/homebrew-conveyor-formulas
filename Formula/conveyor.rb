class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.14/conveyor_darwin_amd64.tar.gz"
    sha256 "65adc44332f88899e9b13ce6ba1e048cc3964934a58c396ba5884d9edec39b65"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.14/conveyor_darwin_arm64.tar.gz"
    sha256 "ba60bda6f9e03df130770f738b0ea891e9a7769906c000aed226ea9d6dc487c2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.14/conveyor_linux_amd64.tar.gz"
    sha256 "7c728f3347cf6b879a3a5fb2455fc6ff17c3e8b8b6a34af167c1dbfcb14c27f8"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.14/conveyor_linux_arm64.tar.gz"
    sha256 "8229a55eff7b6f9f0cc5a29e87071f600195475a7710f141e8f727a7d090f45d"
  end
  version "1.19.14"

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
