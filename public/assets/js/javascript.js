const $APP_URL = "/site_rdd_sae23/public";
const phone = window.innerWidth < 1000;
///////////////////////////////////////////// FORMS ///////////////////////////////////////////////////////// 

// Affichage du mot de passe dans le input ( icone d'oeil )

const passwordInputIcons = document.querySelectorAll(".password-input-icon");

if(passwordInputIcons != null) {
    passwordInputIcons.forEach(icon => {
        icon.addEventListener("click", () => {
            // Parent of the div
            let parent = icon.closest("div");
    
            console.log("check");
    
            // Child of type input
            let input = parent.querySelector("input");
    
            if (input.type == "text") {
                input.type = "password";
                icon.src = `${$APP_URL}/assets/images/svg/password-hidden.svg`;
            } else {
                input.type = "text";
                icon.src = `${$APP_URL}/assets/images/svg/password-show.svg`;
            }
        })
    })
}

// Compte à rebours

let countdownDate = new Date("Jul 7 2023 19:00:00").getTime();
const countdownDay = document.getElementById("countdown-days");
const countdownHour = document.getElementById("countdown-hours");
const countdownMinute =  document.getElementById("countdown-minutes");
const countdownSecond =  document.getElementById("countdown-seconds");

function countdown() {
    let currentDate = new Date().getTime();
    
    let difference = countdownDate - currentDate;

    let days = Math.floor(difference / (1000 * 60 * 60 * 24)).toString();
    let hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)).toString();
    let minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60)).toString();
    let seconds = Math.floor((difference % (1000 * 60)) / 1000).toString();

    if(days.toString().length === 1 ) {
        days = "0" + days;
    } 
    if(hours.toString().length === 1 ) {
        hours = "0" + hours;
    } 
    if(minutes.toString().length === 1 ) {
        minutes = "0" + minutes;
    } 
    if(seconds.toString().length === 1 ) {
        seconds = "0" + seconds;
    }

    countdownDay.innerHTML = days;
    countdownHour.innerHTML = hours;
    countdownMinute.innerHTML = minutes;
    countdownSecond.innerHTML = seconds;

    setTimeout(countdown, 1000);
}

if(countdownDay != null) {
    countdown();
}

//////////////////////////////////////////////////// CONNECTION ////////////////////////////////////////////////////

// Affichage du formulaire de connexion

function openModal(identifier, source=null) {
    let modal = document.getElementById(identifier);

    if(source != null) {
        console.log(source)
        let image = document.getElementById("gallery-modal-photo");
        image.src = source;
    }

    modal.style.display = "block";
    setTimeout(() => {modal.style.opacity = "1"}, 1);
    document.body.style.overflow = "hidden";
}

function closeModal(identifier) {
    let modal = document.getElementById(identifier);

    if(identifier === "connection-modal") {
        connectionScroll("up");
        document.querySelectorAll(".connection-form").forEach(element => {
            element.reset();
        })
    }


    modal.style.opacity = "0";
    setTimeout(() => {modal.style.display = "none"}, 750)
    document.body.style.overflow = "auto";
}


// Scroll dans le formulaire de connexion

function connectionScroll(direction) {
    let connectionWindow = document.getElementById("connection-window")
    let passwordWindowHeight = document.getElementById("password-reinitialise").offsetHeight
    
    if(direction === "down") {
        connectionWindow.scrollBy(0, 9999)
        if(!phone) {
            connectionWindow.style.height = `${passwordWindowHeight}px`;
        }
    } else if(direction === "up") {
        connectionWindow.scrollBy(0, -9999)
        if(!phone) {
            connectionWindow.style.height = "75vh";
        }
    }
}

/////////////////////////////// INSCRIPTION /////////////////////////////////////

// Si on est sur la page de inscription, alors tout ce code est chargé
if(document.getElementById("inscription-container") != null){
    function firstContinue() {
        let div_email = document.getElementById("change-help-email");
        let div_selectPromotion = document.getElementById("change-select-promotion");
        let div_selectOldPromotion = document.getElementById("change-select-oldpromotion");
        let div_inputEntreprise = document.getElementById("change-input-entreprise");
        let div_checkFamily = document.getElementById("change-check-family");
        let div_checkMap = document.getElementById("change-check-map");
        
        switch (statusSelect.value) {
            case "student":            
                div_selectPromotion.style.display = "block";
                div_inputEntreprise.style.display = "block";
                break;
            case "teacher":
                div_email.innerText = "Merci d'utiliser votre mail universitaire ( @univ-rennes1.fr )";
                div_checkFamily.style.display = "none";
                div_checkMap.style.display = "none";
                break;
            case "oldstudent":
                div_email.innerText = "Votre email sera utilisé afin de valider votre inscription";
                div_selectOldPromotion.style.display = "block";
                div_inputEntreprise.style.display = "block";
                div_checkFamily.style.display = "none";
                break;
            case "other":
                div_email.innerText = "Votre email sera utilisé afin de valider votre inscription";
                div_inputEntreprise.style.display = "block";
                div_checkFamily.style.display = "none";
                break;
            }

        // Permet de scroll
        inscriptionScrollable.scrollBy(0,inscriptionScrollableHeight)
    }

    // Fonction du deuxieme bouton "Continuer" dans le formulaire, permet de s'assurer que tout a été bien rentré ( puis scroll vers
    // la page suivante ) et sinon affiché une erreur.
    function secondContinue() {
        // let lastname = document.getElementById("input-lastname")
        // let firstname = document.getElementById("input-firstname")
        // let email = document.getElementById("input-email")
        // let phone_number = document.getElementById("input-phone_number")
        // let entreprise = document.getElementById("input-entreprise")

        // let errors = []
        // let setBorderTo = []

        // if(lastname.value == "") {
        //     errors.push("Vous n'avez pas entré de nom.")
        //     setBorderTo.push(lastname)
        // } else if(lastname.value.length > 20) {
        //     errors.push("Votre nom est trop long")
        //     setBorderTo.push(lastname)
        // }

        // if(firstname.value == "") {
        //     errors.push("Vous n'avez pas entré de prenom.")
        //     setBorderTo.push(firstname)
        // } else if(lastname.value.length > 20) {
        //     errors.push("Votre prenom est trop long")
        //     setBorderTo.push(firstname)
        // }

        // if(email.value == "") {
        //     errors.push("Vous n'avez pas entré d'email.")
        //     setBorderTo.push(firstname)}
        // // } else if(statusSelect.value == "student") {
        // //     // if(email.value.split('@'))
        // // }

        // setBorderTo.forEach(element => {
        //     element.classList.add("error-border")
        // })

        // Permet de scroll
        inscriptionScrollable.scrollBy(0,inscriptionScrollableHeight);
        
        // Si l'eleve n'est pas en alternance, on ne lui propose pas de choisir la ville    
        if(document.getElementById("input-promotion").value == "2AFI") {
            document.getElementById("change-check-map").style.display = "none";
        }
    }

    function submit() {
        let city = document.getElementById("input-city");
        let password = document.getElementById("input-password");
        let confirm_password = document.getElementById("input-confirm_password");
    }


    // Variables pour le scroll
    var inscriptionScrollable = document.getElementById("inscription-scrollable");
    const inscriptionScrollableHeight = inscriptionScrollable.offsetHeight;

    // Traitement du premier select ( etudiant / prof / ancien eleve / autre )

    // Fonction du premier bouton "Continuer" dans le formulaire, permet de adapter le formulaire selon le statut choisi ( etudiant, prof, etc.. )
    const statusSelect = document.getElementById("inscription-select");

    // Verification si le checkbox parents est activé. Si oui, le select du nombre de parents s'active
    // et le texte d'aide apparait.
    const parentsCheck = document.getElementById("parentsCheck")
    const parentsSelectCounts = document.getElementById("parentsSelect")

    parentsCheck.addEventListener("change", () => {
        if (parentsCheck.checked) {
            parentsSelectCounts.disabled = false;
        } else {
            parentsSelectCounts.disabled = true;
        }
    })

    // Verification si le checkbox carte est activé. Si oui, le input de ville s'active
    const MapVisibilityCheck = document.getElementById("MapVisibilityCheck")
    const MapTownInput = document.getElementById("input-city")

    MapVisibilityCheck.addEventListener("change", () => {
        if (MapVisibilityCheck.checked) {
            MapTownInput.disabled = false;
        } else {
            MapTownInput.disabled = true;
        }
    })

    // Vérificiation si l'élève est en alternance ou pas, sinon le input 'entreprise' est desactivé
    const promotionSelect = document.getElementById("input-promotion")
    const inputEntreprise = document.getElementById("input-entreprise")

    promotionSelect.addEventListener("change", () => {
        if (promotionSelect.value == "2AFI") {
            inputEntreprise.disabled = true;
        } else {
            inputEntreprise.disabled = false;
        }
    })

    // Code pour téléphone -> Changement des options du select de promotion
    // On passe de Licence Professionnelle à LP pour gagner de l'espace
    // Et changements des labels des checks

    if (phone) {
        let possibleOptions = ["BUT R&T 2 FI", "BUT R&T 2 FA", "LP CART", "LP RIMS", "LP TSSR"];
        let options = promotionSelect.children;

        for(i = 0; i < options.length; i++) {
            options[i].text = possibleOptions[i];
        }

        document.getElementById("label-ListVisibilityCheck").innerHTML = "Apparaître dans la listes des participants";
        document.getElementById("label-MapVisibilityCheck").innerHTML = "Apparaître sur la carte";
    }
}
/////////////////////////////////// HEADER //////////////////////////////

const navbar = document.querySelector("header")
const navbarToggler = document.getElementById("navbar-toggler")
const headerBackground = document.getElementById("header-background-scroll")

navbarToggler.addEventListener("click", () => {
    navbar.classList.toggle("toggle")
    if(navbar.classList.contains("toggle")) {
        navbar.style.backgroundColor = "var(--blue)";
    } else {
        navbar.style.backgroundColor = "transparent";
    }
})

window.addEventListener("scroll", () => {
    if(window.scrollY > 200) {
        headerBackground.style.height = "100%";
    } else {
        headerBackground.style.height = "0%";
    }
})

if(window.scrollY > 200) {
    headerBackground.style.height = "100%";
}

////////////////////// GALLERIE /////////////////////////////

// Animation lors du chargement de la page ( title wrapper )

function titleAnimation(identifier) {
    let title = document.getElementById(identifier)
    let letters = title.children

    for(let i = 0; i < letters.length; i++) {
        setTimeout( () => {
            letters[i].style.transform = "translateY(0)";
            letters[i].style.opacity = "1";
        }, i*75)
    }   
}

const gallery = document.getElementById("gallery")

if(gallery != null) {
    if(gallery.children.length == 0) {
        gallery.innerHTML = "<span class='inscription-info-text text-white'>Une fois la cérémonie passée, les photos apparaitront ici.</span>"
    }
}

const images = document.querySelectorAll(".gallery-image-wrapper")

if(images != null) {
    images.forEach( image => {
        image.addEventListener("click", () => {
            let photo = image.children[0].src;

            openModal("gallery-modal", photo)
        })
    })
}

/////////////////////////// ORGANISATION ///////////////////////

const timelineIcons = document.querySelectorAll(".timeline-icon")

if(phone && timelineIcons != null) {
    timelineIcons.forEach(icon => {
        icon.classList.toggle("fa-5x");
        icon.classList.toggle("fa-2x");
    })
}

// NOTIFICATIONS

const notification = document.getElementById("notification-wrapper");
const closeNotificationButton = document.getElementById("closeNotificationButton");

function closeNotification() {
    notification.style.transform = "translateY(-50px)";
    notification.style.opacity = "0";
    setTimeout( () => {notification.style.display = "none"}, 500);
}

function openNotification() {
    notification.style.transform = "translateY(0)";
    notification.style.opacity = "1";
}

if(notification != null) {
    closeNotificationButton.addEventListener("click", () => {
        closeNotification()
    });
    openNotification();
}

// Prends un array d'identifiants en parametres, 0 - error container, 1 - error img, 2 - error title ( objet typewriter ), 3 - error text
function showError(element, error) {

    let container = document.getElementById(errorElementId + "-container");
    let image = document.getElementById(errorElementId + "-image");
    let text = document.getElementById(errorElementId + "-text");

    text.innerHTML = error
    
    image.src = `${$APP_URL}/assets/images/creators/creator_error.png`;
    // elements[2]
    //     .deleteAll(1)
    //     .typeString('Oops! Erreur!')
    //     .start()
    container.classList.toggle("tada");
}