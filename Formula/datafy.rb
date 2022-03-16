class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.3/datafy_darwin_amd64.tar.gz"
    sha256 "8565da5dcefeff35172d6c7046f86e20277ed7b13adc991bbb5bf256ae17d2a7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.3/datafy_darwin_arm64.tar.gz"
    sha256 "f79ea00499acf78e159435fff71911df64129ade40c2441c7e48ffeb4039af66"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.61.3/datafy_linux_amd64.tar.gz"
    sha256 "06922d263212ab771b7df89dba54a2e8396261990eee336d9d1fadaf906e1f1b"
  end
  version "0.61.3"

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
