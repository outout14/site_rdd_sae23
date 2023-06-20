<html lang="fr">
<head>
  <title>Réinitialisation de votre mot de passe</title>
  <meta charset="UTF-8">
</head>
<body>
<h1>Réinitialisation de votre mot de passe</h1>
<p>Bonjour <strong>{$args["user"]->firstname|unescape:"htmlall"|capitalize}</strong>,</p>
<p>Vous avez demandé la réinitialisation de votre mot de passe sur le site de Génération R&T.</p>
<hr>
<p>Pour réinitialiser votre mot de passe, cliquez sur le lien suivant.</p>
<p><a href="{$args["encryptedEmailURL"]}">{$args["encryptedEmailURL"]}</a></p>
<p><i>Ce lien expire dans 10 minutes. Si vous n'êtes pas à l'origine de cette requête ignorez ce mail.</i></p>
<hr>
<p>Cordialement,<br/>L'Equipe de Génération R&T.</p>
</body>
</html>
