require "formula"

class AitCli < Formula
    homepage "https://ipsoft.com"
    url "https://github.com/ipsoft-ait/ait-cli.git"
    head "https://github.com/ipsoft-ait/ait-cli.git"

    depends_on "go" => :build

    def install
        ENV["GOPATH"] = buildpath

        # Install Go dependencies
        system "go", "get", "github.com/mitchellh/go-homedir"
        system "go", "get", "github.com/spf13/cobra"
        system "go", "get", "github.com/spf13/viper"

        system "go", "build", "-o", "ait"
        bin.install "ait"
    end

    test do
        system "#{bin}/ait", "-v"
    end
end