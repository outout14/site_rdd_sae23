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
          showError(errorElementId, data.error, typeWriterObject); // Display the error message
        }
      }
    })
    .catch(error => {
      console.error('An error occurred:', error);
    });
}

// Function to display the error message
function displayError(errorMessage, errorElementId) {
  const errorContainer = document.getElementById(errorElementId + '-container');
  const errorTypeit = document.getElementById(errorElementId + '-typeit');
  const errorText = document.getElementById(errorElementId + '-text');

  // Update the error message
  errorTypeit.textContent = 'Erreur ! ';
  errorText.textContent = errorMessage;

  // Show the error container
  errorContainer.style.display = 'block';
}

// LOGIN PASSWORD FORM
const login_form = document.getElementById('login_form') 
login_form.addEventListener('submit', function(event) {
  event.preventDefault();
  submitForm(login_form, "login", "login_success", login_typeWriter);
});

// FORGOT PASSWORD FORM
const forgot_password_form = document.getElementById('forgot_password_form') 
forgot_password_form.addEventListener('submit', function(event) {
  event.preventDefault();
  submitForm(forgot_password_form, "forgot_password", "password_mail_sent", forgot_password_typeWriter);
});
