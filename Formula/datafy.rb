class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.7/datafy_darwin_amd64.tar.gz"
    sha256 "2814b8b03675a413e8cdf54647f0e74ac831ec9b348c0c9be6375084472cc06b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.7/datafy_darwin_arm64.tar.gz"
    sha256 "0a37bcdfaf0c50343932587a7aa77a6ba8f89037974f46914f4bcb6d87059a64"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.7/datafy_linux_amd64.tar.gz"
    sha256 "a8e4a61d79f53fb557eae78c247f2fadbd1c072e14abfe8bce8d1cdf4bbe9449"
  end
  version "0.61.7"

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
