class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.63.3/datafy_darwin_amd64.tar.gz"
    sha256 "6d17125e8ca4d8ec33587fc553b5b6cf501f137f87159c41408eda849d86714e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.63.3/datafy_darwin_arm64.tar.gz"
    sha256 "c5f06f2aed44257eb01affa9cbbb3136d96ef5d5bdafc84cf06c0cf6859ab127"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.63.3/datafy_linux_amd64.tar.gz"
    sha256 "3107cc17225577a43edbf9edffbd0f2eeec34b014a066bda60873af83079f3af"
  end
  version "0.63.3"

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
