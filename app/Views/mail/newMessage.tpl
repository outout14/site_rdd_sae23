<html lang="fr">
<head>
  <title>Nouveau message</title>
  <meta charset="UTF-8">
</head>
<body>
<h1>Un nouveau message a été reçu</h1>
<p><strong>Auteur</strong> : {$args["email"]}</p>
<hr>
<p>Contenu du message :</p>
<pre>
{$args["message"]}
</pre>
</body>
</html>
