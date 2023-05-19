// Function to handle form submission via AJAX
function submitForm(form, errorElementId, successNotification,typeWriterObject) {
  const formData = new FormData(form);

  // Send an AJAX request
  fetch(form.action, {
    method: form.method,
    body: formData
  })
    .then(response => response.json())
    .then(data => {
      // Check if there is an error in the response
      if (data.error) {
        if(data.error == "_success") {
          console.log("Utilisateur connecté");
          window.location.href = "./?notification=" + successNotification; // Redirection vers la page d'accueil
        } else {
          if(errorElementId != null){
            showError(errorElementId, data.error, typeWriterObject); // Display the error message
          } else {
            spawnNotification("error", data.error); // Display the error message
          }
        }
      }
    })
    .catch(error => {
      console.error('An error occurred:', error);
    });
}

// LOGIN PASSWORD FORM
// check if element exists
if(document.getElementById('login_form')) {
  const login_form = document.getElementById('login_form')
  login_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(login_form, "login", "login_success", login_typeWriter);
  });
}

// FORGOT PASSWORD FORM
if(document.getElementById('forgot_password_form')) {
  const forgot_password_form = document.getElementById('forgot_password_form')
  forgot_password_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(forgot_password_form, "forgot_password", "password_mail_sent", forgot_password_typeWriter);
  });
}

// FORGOT PASSWORD FORM
if(document.getElementById('register_form')) {
  console.log("ok");
  const register_form = document.getElementById('register_form')
  register_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(register_form, null, "register_success", null);
  });
}

// FORGOT PASSWORD PAGE FORM (NEW PASSWORD)
if(document.getElementById('new_password_form')) {
  const new_password_form = document.getElementById('new_password_form')
  new_password_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(new_password_form, "new_password", "password_reset", new_password_typeWriter);
  });
}

