class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.6/datafy_darwin_amd64.tar.gz"
    sha256 "3fde6666bff8c9b750c29d08ef119eaee44413e972fddc7427a1ab9419cbda3d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.6/datafy_darwin_arm64.tar.gz"
    sha256 "f2f7941d602c04218fc951e8694dd0b4e375ed7d8e743251bd5e8b5d8f542eaf"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.6/datafy_linux_amd64.tar.gz"
    sha256 "3b524a1aebd1d891f6fc40281ed942aaa732c89511bd0420537a05c9feab7648"
  end
  version "0.62.6"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "fish", { :err => :out })
    (fish_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/datafy", "--help"
  end
end
