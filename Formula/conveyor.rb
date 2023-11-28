class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.12.0/conveyor_darwin_amd64.tar.gz"
    sha256 "69417ac049ad8bf393a16a1a29c764fdc1911457848a031e5c972fa35c7f10db"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.12.0/conveyor_darwin_arm64.tar.gz"
    sha256 "169510639819421cb1441f4cef9fef9b890848379bbe95421dfeb1061fea2b50"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.12.0/conveyor_linux_amd64.tar.gz"
    sha256 "cb5a0d218b2d0e14ec3cb74d13d058471c08e93a969219da541cb5a40ac4c85f"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.12.0/conveyor_linux_arm64.tar.gz"
    sha256 "a1a57a9766c91ed6951b3ee1b739822e5874d74fc1dcc9039a8b922acf6c282d"
  end
  version "1.12.0"

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
