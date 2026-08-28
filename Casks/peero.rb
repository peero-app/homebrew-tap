cask "peero" do
  version "1.0.2"
  sha256 "7c8bab7370bd7a286a8180b53448221ec46e44b23c90dbb805c7dde433740452"

  url "https://github.com/peero-app/peero/releases/download/v#{version}/peero-macos.zip"
  name "Peero"
  desc "Local network messaging with text, voice messages, and file transfer"
  homepage "https://peero-app.github.io/peero/"

  # L'app se met à jour elle-même (Réglages > Rechercher les mises à jour).
  auto_updates true
  depends_on :macos

  app "peero.app"

  # peero n'est ni signée avec un identifiant « Developer ID » ni notarisée
  # par Apple. Homebrew met en quarantaine tout ce qu'un cask télécharge, et
  # macOS refuse alors de lancer une app non notarisée (« … est endommagée »
  # ou « impossible de vérifier l'absence de logiciel malveillant »), voire
  # tue le process au démarrage sur Apple Silicon. On retire l'attribut de
  # quarantaine juste après l'installation pour que l'app démarre du premier
  # coup. must_succeed: false → xattr renvoie un code non nul si l'attribut
  # est déjà absent, ce qui ne doit pas faire échouer l'installation.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-cr", "#{appdir}/peero.app"],
                   sudo:         false,
                   must_succeed: false
  end

  # L'app est sandboxée : ses données vivent sous ~/Library/Containers.
  zap trash: [
    "~/Library/Application Support/com.sikander.peero",
    "~/Library/Caches/com.sikander.peero",
    "~/Library/Containers/com.sikander.peero",
    "~/Library/HTTPStorages/com.sikander.peero",
    "~/Library/Preferences/com.sikander.peero.plist",
    "~/Library/Saved Application State/com.sikander.peero.savedState",
  ]

  caveats <<~EOS
    peero n'est pas signée ni notarisée par Apple.

    Ce cask retire automatiquement la mise en quarantaine à l'installation ;
    l'app devrait donc se lancer directement. Si macOS la bloque malgré tout,
    faites un clic droit sur l'app puis « Ouvrir », ou lancez :

      xattr -cr /Applications/peero.app
  EOS
end
