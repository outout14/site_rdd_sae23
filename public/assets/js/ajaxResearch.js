function submitForm(form, errorElementId, successNotification, typeWriterObject) {
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
                if (data.error == "_success") {
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