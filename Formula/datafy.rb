class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.60.0/datafy_darwin_amd64.tar.gz"
    sha256 "75f76c3b89c830b644987a1a827e5de63aaf31f0bd213b24542eb03077abe07c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.60.0/datafy_darwin_arm64.tar.gz"
    sha256 "25582ac670bcf3298daf3f8db3515c59d596b00b50661a17f498d45ad720ae3b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.60.0/datafy_linux_amd64.tar.gz"
    sha256 "77c25a6d2a06b3935643e219dcc99a362d8bb9f16b89fa026ea0962d25dc2d5b"
  end
  version "0.60.0"

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
