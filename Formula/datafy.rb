class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.54.2/datafy_darwin_amd64.tar.gz"
    sha256 "9539d31b82e6cf987dad70925b9eafa920c947946a3c562891dd46cbe845cbac"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.54.2/datafy_linux_amd64.tar.gz"
    sha256 "4edbf9d9a99f1299267e64d9a01b54bd41effcb0700e923d9d6644dfcd78a602"
  end
  version "0.54.2"

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
end
