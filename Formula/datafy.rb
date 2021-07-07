class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.50.1/datafy_darwin_amd64.tar.gz"
    sha256 "6a9af7a6d3ccf219938ac4cf26381b855c09be6573a7e505494ace9cc07adeec"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.50.1/datafy_linux_amd64.tar.gz"
    sha256 "a15fc881a669ec0bbd1c0af96336c29e7c6e652af76c67fc49c5833564fc5088"
  end
  version "0.50.1"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"datafy").write output
  end
end