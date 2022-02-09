class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.1/datafy_darwin_amd64.tar.gz"
    sha256 "a7ebc8558358640ff4bb03b03f6ae8bc3567b36b9f90c58dde40025c1e3a5a61"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.1/datafy_darwin_arm64.tar.gz"
    sha256 "3f4af5e656e3cfe2a008047f2d466b3669ce946d346fc537e4eea52d29d29e89"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.1/datafy_linux_amd64.tar.gz"
    sha256 "e2773d5f1c1ac4c2c994bdb2bbe162261c2c9a477e2b4b7ef0417b1dec183ac9"
  end
  version "0.59.1"

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
