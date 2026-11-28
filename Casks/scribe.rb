# frozen_string_literal: true

cask "scribe" do
  version "1.0.1"
  sha256 "48799485d5d51b550d728e118c488f3b43cb726a5873bf5f95b2446fbdfbc374"

  url "https://github.com/AgentC-Consulting/scribe-app/releases/download/v#{version}/Scribe-Free-#{version}.dmg"
  name "Scribe"
  desc "Free, on-device dictation app"
  homepage "https://github.com/AgentC-Consulting/scribe-app"

  livecheck do
    url "https://github.com/AgentC-Consulting/scribe-app/releases"
    strategy :github_releases
    regex(/^v?(\d+\.\d+\.\d+(?:-beta\.\d+)?)$/i)
  end

  depends_on arch:  :arm64
  depends_on macos: :tahoe

  app "Scribe.app"

  zap trash: [
    "~/Library/Application Support/Scribe",
    "~/Library/Preferences/com.scribeapp.scribe.plist",
    "~/Library/Saved Application State/com.scribeapp.scribe.savedState",
  ]
end
