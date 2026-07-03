cask "autokalena" do
  version "0.1.4"
  sha256 "3bf211826644532b4133c18c73cbc3fb92121a87f88958704c367231d2f220da"

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
