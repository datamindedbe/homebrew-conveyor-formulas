class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.2/datafy_darwin_amd64.tar.gz"
    sha256 "8badca2934d4dc9e36060be15df6b2e991d602bd61924bbba5da38ad251705a9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.2/datafy_darwin_arm64.tar.gz"
    sha256 "e9b09c8cebd679cf38d95dbf00bc0f779d386c94ed61c13288fe523f8c430456"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.2/datafy_linux_amd64.tar.gz"
    sha256 "683964f42479848912bd052b7b59b767faa05567147ef8e2815d6468c567c08b"
  end
  version "0.61.2"

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
