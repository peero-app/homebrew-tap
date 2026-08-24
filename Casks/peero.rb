cask "peero" do
  version "2.0.1"
  sha256 "a03db412268f288b8b47baa34a79192efd1e2b0e596572c2db747ff683bbb911"

  url "https://github.com/peero-app/peero/releases/download/v#{version}/peero-macos.zip"
  name "Peero"
  desc "Local network messaging with text, voice messages, and file transfer"
  homepage "https://peero-app.github.io/peero/"

  app "peero.app"

  caveats <<~EOS
    peero n'est pas signe/notarise par Apple. Au premier lancement, si
    macOS bloque l'ouverture, faites un clic droit sur l'app > Ouvrir,
    ou lancez : xattr -cr /Applications/peero.app
  EOS
end
