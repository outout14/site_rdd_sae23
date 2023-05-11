<html>
<head>
  <meta charset="UTF-8">
</head>
<body>
  <h1>Bienvenue <strong>{$args["user"]->firstname|capitalize}</strong> sur le site de la Remise des Diplômes</h1>
  <p>Pour confirmer votre inscription à ce site et votre venue, veuillez cliquer sur le lien ci-dessous :</p>
  <p>Vous devez vérifier votre mèl</p>
  <p><a href="{$args["encryptedEmailURL"]}">{$args["encryptedEmailURL"]}</a></p>
  <hr>
  <p>Cordialement,<br/>L'Equipe de Génération R&T.</p>
</body>
</html>
