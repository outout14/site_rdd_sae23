<?php

if(password_verify("bonjour", '$2y$10$nQJ48SL3MNLG2x37CPMS3eoR12GyugxSOW44TKwGSmhshpQDuGz42')){
  echo "ok";
} else {
  echo "pas ok";
}

