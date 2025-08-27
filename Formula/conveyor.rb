class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.9/conveyor_darwin_amd64.tar.gz"
    sha256 "cbe9f3e7cb3eeb22eca4d26328331d9adfcd3707f76349b1994519a66c5d6ebe"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.9/conveyor_darwin_arm64.tar.gz"
    sha256 "2d44d8510c11c419dcca6a0e0417f13a24d58725bfd9b8f14800807188cc5475"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.9/conveyor_linux_amd64.tar.gz"
    sha256 "cd62f5e6319d91da2e42d36529bb0c07bf7595f84910b007f7e69f683cac20af"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.9/conveyor_linux_arm64.tar.gz"
    sha256 "d6b03589ac2fa256ce4503b533a23bf3e66109c1bf0c7a6460871f587c19d89d"
  end
  version "1.19.9"

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
