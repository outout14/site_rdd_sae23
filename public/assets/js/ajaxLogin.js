// Function to handle form submission via AJAX
function submitForm(form, errorElementId, successNotification, typeWriterObject) {
  const formData = new FormData(form);

  if(form == document.getElementById("register_form")) {
    openModal("loader-modal")
  }
  // Send an AJAX request
  fetch(form.action, {
    method: form.method,
    body: formData
  })
    .then(response => response.json())
    .then(data => {
      // Check if there is an error in the response
      if (data.error) {
        if (data.error === "_success") {
          console.log("Utilisateur connecté");
          if(successNotification === "register_success"){
            scrollRegister();
            closeModal("loader-modal")
            setTimeout( () => {
              location.href = "../"
            }, 10000)
          } else {
            window.location.href = "./?notification=" + successNotification; // Redirection vers la page d'accueil
          }
        } else {
          // Empty fields of the form
          // form.reset();

          // if the form is the register form, reset the captcha
          if(form == document.getElementById("register_form")){
            hcaptcha.reset(c);
          }

          var captchaElements = document.getElementsByClassName('h-captcha-register');
          for (var i = 0; i < captchaElements.length; i++) {
            var captchaElement = captchaElements[i];
            hcaptcha.reset(captchaElement.getAttribute('data-hcaptcha-widget-id'));
          }

          if (errorElementId != null) {
            showError(errorElementId, data.error, typeWriterObject); // Display the error message
          } else {
            closeModal("loader-modal")
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
if (document.getElementById('login_form')) {
  const login_form = document.getElementById('login_form')
  login_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(login_form, "login", "login_success", login_typeWriter);
  });
}

// FORGOT PASSWORD FORM
if (document.getElementById('forgot_password_form')) {
  const forgot_password_form = document.getElementById('forgot_password_form')
  forgot_password_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(forgot_password_form, "forgot_password", "password_mail_sent", forgot_password_typeWriter);
  });
}

// REGISTER FORM
if (document.getElementById('register_form')) {
  const register_form = document.getElementById('register_form')
  register_form.addEventListener('submit', function (event) {
    event.preventDefault();

    // CHECK IF PASSWORD > 8 CHARS OR EQUAL TO CONFIRM PASSWORD
    var password = document.getElementById("input-password-register")
    var confirmpassword = document.getElementById("input-confirmpassword-register")

    if(password.value != confirmpassword.value) {
        spawnNotification("error", "Les mots de passe ne correspondent pas.")
        return
    }
    if(password.value.length < 8) {
        spawnNotification("error", "Le mot de passe doit contenir au moins 8 caractères.")
        return
    }

    submitForm(register_form, null, "register_success", null);
  });
}

// FORGOT PASSWORD PAGE FORM (NEW PASSWORD)
if (document.getElementById('new_password_form')) {
  const new_password_form = document.getElementById('new_password_form')
  new_password_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(new_password_form, "new_password", "password_reset", new_password_typeWriter);
  });
}

// CONTACT FORM
if (document.getElementById('contact_form')) {
  const contact_form = document.getElementById('contact_form')
  contact_form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(contact_form, null, "contact_sent", null);
  });
}

/*
  NOTIFICATIONS
  Dynamically create a notification and append it to the DOM
 */
function spawnNotification(title, content) {
  var notificationWrapper = document.createElement('div');
  notificationWrapper.className = 'py-2 px-2 px-lg-4 gap-lg-3';
  notificationWrapper.id = 'notification-wrapper';

  var closeButtonDiv = document.createElement('div');
  closeButtonDiv.className = 'fixed-top d-flex justify-content-end mt-2 mx-3';

  var closeButton = document.createElement('i');
  closeButton.className = 'bi bi-x-lg hover-pointer';
  closeButton.id = 'closeNotificationButton';

  closeButton.addEventListener('click', function () {
    notificationWrapper.style.transform = "translateY(-50px)"
    notificationWrapper.style.opacity = "0"
  
    setTimeout( () => {
      notificationWrapper.remove();
    }, 500)
  });

  closeButtonDiv.appendChild(closeButton);
  notificationWrapper.appendChild(closeButtonDiv);

  var avatarDiv = document.createElement('div');
  avatarDiv.className = 'avatar-xs border-lightgrey';

  var avatarImg = document.createElement('img');
  avatarImg.src = '/assets/images/creators/creator_pc.png';
  avatarImg.alt = 'creator_message';
  avatarImg.className = 'avatar-img';

  avatarDiv.appendChild(avatarImg);
  notificationWrapper.appendChild(avatarDiv);

  var contentDiv = document.createElement('div');
  contentDiv.className = 'text-complementary';
  contentDiv.textContent = content;

  notificationWrapper.appendChild(contentDiv);

  // Apply additional styling to make the notification visible
  document.body.appendChild(notificationWrapper);

  setTimeout( () => {
    notificationWrapper.style.transform = 'translateY(0)';
    notificationWrapper.style.opacity = '1';
  }, 1)
  
  // Clear it after 5 seconds
  setTimeout(function () {
    notificationWrapper.style.transform = "translateY(-50px)"
    notificationWrapper.style.opacity = "0"
  
    setTimeout( () => {
      notificationWrapper.remove();
    }, 500)
  }, 5000);
}

