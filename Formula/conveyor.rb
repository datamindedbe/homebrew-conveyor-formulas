class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.17/conveyor_darwin_amd64.tar.gz"
    sha256 "5dfe9e2409e9e98c90302853972cb9ebe71c64ad0954c2ceba0c7bc05afb6c4e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.10.17/conveyor_darwin_arm64.tar.gz"
    sha256 "6f5493a9afbcbc4ea9a0c93d559ab29dcbc1b9e8e71121c62471e206ab3fba8a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.17/conveyor_linux_amd64.tar.gz"
    sha256 "ccc4ba940c5afbc1e394b1be8093aae14de91fc1eaeba89d6f1bdb054c31f3e8"
  end
  version "1.10.17"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "bash", { :err => :out })
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "zsh", { :err => :out })
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "fish", { :err => :out })
    (fish_completion/"conveyor.fish").write output
    (zsh_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/conveyor", "--help"
  end
end
