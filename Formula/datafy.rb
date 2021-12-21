class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.56.5/datafy_darwin_amd64.tar.gz"
    sha256 "309038b9111724d5f7d4276a476122826ea67bfed85f59c299d29009a9785b71"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.56.5/datafy_darwin_arm64.tar.gz"
    sha256 "a372e6373b3b474f9fba059ac058336cdad31787f8259bf9d9c3eceef7345dab"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.56.5/datafy_linux_amd64.tar.gz"
    sha256 "68d5e6b4889a8049da2bb90aa59b2eabdaee013881364ab359d1b68e8a6fe127"
  end
  version "0.56.5"

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
