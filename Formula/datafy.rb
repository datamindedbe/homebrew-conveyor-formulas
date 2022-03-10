class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.60.1/datafy_darwin_amd64.tar.gz"
    sha256 "3c6b3fdb93c3fa4a376625c348818eb1e377670f6bd9894e6cd525448ffeba99"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.60.1/datafy_darwin_arm64.tar.gz"
    sha256 "94708e17d701cb65a5ede870923107161816afccee49d8747f720b79f11b8998"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.60.1/datafy_linux_amd64.tar.gz"
    sha256 "7d81c08a0ad31a62f80ba86d9e85a9f34db081f05563f459f540ab8e20a00606"
  end
  version "0.60.1"

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
