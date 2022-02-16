class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.2/datafy_darwin_amd64.tar.gz"
    sha256 "e0eddd633f1f7b45fea47729698f87b957ccd0ccb8f7a34b9f0ebab58c263273"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.2/datafy_darwin_arm64.tar.gz"
    sha256 "70707748f9811527dd1190f73b2d36837978f2e47232dc28b2cc93aec22773e1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.2/datafy_linux_amd64.tar.gz"
    sha256 "6a1534669cea422b1cadc2a58e242090825d25a19810c39e66485523bcb741ec"
  end
  version "0.59.2"

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
