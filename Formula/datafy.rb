class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.4/datafy_darwin_amd64.tar.gz"
    sha256 "826d7e9790b527b136a194d9cd5c613ec1ff04edf0c6738575f35bb6c85abbf3"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.4/datafy_darwin_arm64.tar.gz"
    sha256 "fbac30c4dc5f539fab5ea9e797ba878b3fcc8b28e4e795f546422e2ee88e0171"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.4/datafy_linux_amd64.tar.gz"
    sha256 "ca7b1655e17ee75e7590165131142aa77b81973f03268cee1e158c7a9120bcb1"
  end
  version "0.59.4"

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
