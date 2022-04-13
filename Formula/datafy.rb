class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.4/datafy_darwin_amd64.tar.gz"
    sha256 "6c730d6383337fbc46a59ae47030a4b00cd2afc02ef9eada73ca219bc91dcfc3"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.4/datafy_darwin_arm64.tar.gz"
    sha256 "4a786dfccdfd59da4cdb73a62c159f0d542ad99c0ce9a5fdf38a684892d11db4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.4/datafy_linux_amd64.tar.gz"
    sha256 "785b070f4b0303fa9905c0cb67b7da4081a9e13d25e8711ad18f158b18d038fc"
  end
  version "0.62.4"

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
