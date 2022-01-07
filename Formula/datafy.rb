class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.58.0/datafy_darwin_amd64.tar.gz"
    sha256 "03639e6e078395c4b969d294f8570094316f7c9520bc4b0acb739e7645cea7a2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.58.0/datafy_darwin_arm64.tar.gz"
    sha256 "fd24cb7e5d50dc3f917c4e734d47e493387c77edc81ba1d6655faec6a75c04e8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.58.0/datafy_linux_amd64.tar.gz"
    sha256 "78f8503647fbe510b724b987bfa1a88b2dda25f0279f83e77d307561ac3587d6"
  end
  version "0.58.0"

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
