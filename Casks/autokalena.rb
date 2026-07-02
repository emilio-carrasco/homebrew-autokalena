cask "autokalena" do
  version "0.1.0"
  sha256 "8564a2f8e6a8be3b193a67f41fbba024b0dd67d052507ca5aa7d42303f51b5e3"

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
