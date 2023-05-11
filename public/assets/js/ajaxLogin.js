// Function to handle form submission via AJAX
function submitForm(form, errorElementId, successNotification) {
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
          displayError(data.error, errorElementId); // Display the error message
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
document.getElementById('login-form').addEventListener('submit', function(event) {
  event.preventDefault();
  const form = document.getElementById('login-form');
  submitForm(form, "connection-error", "login_success");
});

// FORGOT PASSWORD FORM
document.getElementById('forgot-password-form').addEventListener('submit', function(event) {
  event.preventDefault();
  const form = document.getElementById('forgot-password-form');
  submitForm(form, "forgot-password-error", "password_mail_sent");
});
