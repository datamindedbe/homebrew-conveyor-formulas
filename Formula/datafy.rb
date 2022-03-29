class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.0/datafy_darwin_amd64.tar.gz"
    sha256 "bab8556c858448095f19e886a669f0e51e482ed4c5bfab4b746e146dd8750f79"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.0/datafy_darwin_arm64.tar.gz"
    sha256 "6dae5b4132c71d3568f44add13f5441b344aff3929888ad6989e9409028cb6b2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.0/datafy_linux_amd64.tar.gz"
    sha256 "8c603d40b432a5baf783faf224ec9c8019c604e979319c9ba259b87e42c82e68"
  end
  version "0.62.0"

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
