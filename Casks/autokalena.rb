cask "autokalena" do
  version "0.1.7"
  sha256 "ca883715fc162732cc4e3c89c9564134cf5a641ffd70137d39437d3d1ed3749c"

  url "https://github.com/emilio-carrasco/autokalena/releases/download/v#{version}/AutoKalena-macos.dmg"
  name "AutoKalena"
  desc "Reserva tu plaza de parking automaticamente"
  homepage "https://github.com/emilio-carrasco/autokalena"

  app "AutoKalena.app"

  # App sin firmar (sin cuenta de Apple Developer): quitamos la cuarentena para que
  # Gatekeeper no la bloquee al abrir.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AutoKalena.app"]
  end

  zap trash: [
    "~/Library/Application Support/AutoKalena",
  ]
end
