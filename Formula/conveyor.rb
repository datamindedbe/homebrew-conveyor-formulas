class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.30/conveyor_darwin_amd64.tar.gz"
    sha256 "785ed2b8b705b44b55ca8dc817215a3772971d0aa9229e2e976c4469c081c2f1"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.30/conveyor_darwin_arm64.tar.gz"
    sha256 "0f28eaaa4562f6e391aaa7059f270905f1cd12d0ea1a0f1c9d353f35af9f3fee"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.30/conveyor_linux_amd64.tar.gz"
    sha256 "715382e87c682ebed13ce1c74badbf8eabca166c9afdf6021f7bfc5c24986828"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.30/conveyor_linux_arm64.tar.gz"
    sha256 "f99cde0de764b63d510a1cff4133b222d7cf317446d0205889bfc06498f2cab1"
  end
  version "1.18.30"

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
