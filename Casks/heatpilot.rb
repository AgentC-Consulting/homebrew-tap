cask "heatpilot" do
  version "1.2.0"
  sha256 "32d64765dfcdfd3bae9cf1507f29c464ea36308907ede8a6b1fa0112ed6872ab"

  url "https://github.com/AgentC-Consulting/heatpilot/releases/download/v#{version}/HeatPilot-Installer.dmg"
  name "HeatPilot"
  desc "Free menu-bar fan control for Apple Silicon Macs"
  homepage "https://agentc.consulting/heatpilot"

  livecheck do
    url "https://github.com/AgentC-Consulting/heatpilot/releases"
    strategy :github_releases
    regex(/^v?(\d+\.\d+\.\d+)$/i)
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch:  :arm64

  app "HeatPilot.app"

  zap trash: [
    "/Library/Application Support/HeatPilot",
    "/Library/Logs/HeatPilot.log",
    "~/Library/Application Support/HeatPilot",
    "~/Library/Caches/com.agentc.heatpilot",
    "~/Library/HTTPStorages/com.agentc.heatpilot",
    "~/Library/Preferences/com.agentc.heatpilot.plist",
  ]
end
