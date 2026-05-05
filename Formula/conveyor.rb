class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.6/conveyor_darwin_amd64.tar.gz"
    sha256 "c4c32ec1ded3915c68cbb6036dbab6ec1aff38defe6d0197d58f70d2643652ff"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.6/conveyor_darwin_arm64.tar.gz"
    sha256 "ed806102b13f02dcbd6ee2dbbd5d45bece74aad8afe6e39d8d0f40a63265dd5f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.6/conveyor_linux_amd64.tar.gz"
    sha256 "0d4acdb6439bb123cb6821cb21ad50f78e399a8ed1442b159e27e98b39937a7e"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.6/conveyor_linux_arm64.tar.gz"
    sha256 "aa167f6706f45541ac9f3f823b87e75f5895f9de3b8d9c5eb68c2ddb164b369a"
  end
  version "1.21.6"

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
