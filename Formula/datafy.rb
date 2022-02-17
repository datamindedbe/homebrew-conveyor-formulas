class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.3/datafy_darwin_amd64.tar.gz"
    sha256 "c0333703444b2025e9d0a1017556809d7142c75f0a710f49ce8537a4333608b4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.3/datafy_darwin_arm64.tar.gz"
    sha256 "6334ad4b59e4a4ee995bfff6b3a64f761e96f4ce8fd5dd13d90aae1c94f83212"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.3/datafy_linux_amd64.tar.gz"
    sha256 "55efd38aa9fbd5608061da59b11e09f6d5430145b1133b7cd633195c4d4e26b8"
  end
  version "0.59.3"

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
