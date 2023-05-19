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
    // Variables pour le scroll
    var inscriptionScrollable = document.getElementById("inscription-scrollable");
    const inscriptionScrollableHeight = inscriptionScrollable.offsetHeight;

    function firstContinue() {
        let input_status = document.getElementById("input-status");

        let help_email = document.getElementById("help-email")

        let container_promotion = document.getElementById("container-promotion")
        let input_promotion = document.getElementById("input-promotion")

        let container_oldpromotion = document.getElementById("container-oldpromotion")
        let input_oldpromotion = document.getElementById("input-oldpromotion")

        let container_company = document.getElementById("container-company")
        let input_company = document.getElementById("input-company")

        let container_map = document.getElementById("container-map")
        let input_checkmap = document.getElementById("input-checkmap")
        let input_map = document.getElementById("input-map")

        let container_family = document.getElementById("container-family")
        let input_checkfamily = document.getElementById("input-checkfamily")
        let input_countfamily = document.getElementById("input-countfamily")

        switch (input_status.value) {
            case "student":
                help_email.innerHTML = "Merci d'utiliser votre mail universitaire (@etudiant.univ-rennes1.fr)";
                
                container_promotion.classList.toggle("d-none");
                input_promotion.disabled = false;

                container_company.classList.toggle("d-none");
                input_promotion.addEventListener("change", () => {
                    if (input_promotion.value == "2AFI") {
                        input_company.disabled = true;
                    } else {
                        input_company.disabled = false;
                    }
                })

                container_map.classList.toggle("d-none");
                input_checkmap.addEventListener("change", () => {
                    if (input_checkmap.checked) {
                        input_map.disabled = false;
                    } else {
                        input_map.disabled = true;
                    }
                })

                container_family.classList.toggle("d-none");
                input_checkfamily.addEventListener("change", () => {
                    if (input_checkfamily.checked) {
                        input_countfamily.disabled = false;
                    } else {
                        input_countfamily.disabled = true;
                    }
                })

                if(phone){
                    let possibleOptions = ["BUT R&T 2 FI", "BUT R&T 2 FA", "LP CART", "LP RIMS", "LP TSSR"];
                    let options = input_promotion.children;
            
                    for(i = 0; i < options.length; i++) {
                        options[i].text = possibleOptions[i];
                    }
                }
                break;
            case "teacher":
                help_email.innerText = "Merci d'utiliser votre mail universitaire ( @univ-rennes1.fr )";
                break;
            case "oldstudent":
                help_email.innerText = "Votre email sera utilisé pour valider l'inscription";
                
                container_oldpromotion.classList.toggle("d-none");
                input_oldpromotion.disabled = false;

                container_company.classList.toggle("d-none");
                input_company.disabled = false;

                container_map.classList.toggle("d-none");
                input_checkmap.addEventListener("change", () => {
                    if (input_checkmap.checked) {
                        input_map.disabled = false;
                    } else {
                        input_map.disabled = true;
                    }
                })
                break;
            case "other":
                help_email.innerText = "Votre email sera utilisé pour valider l'inscription";
                
                container_company.classList.toggle("d-none");
                input_company.disabled = false;

                container_map.classList.toggle("d-none");
                input_checkmap.addEventListener("change", () => {
                    if (input_checkmap.checked) {
                        input_map.disabled = false;
                    } else {
                        input_map.disabled = true;
                    }
                })
                break;
            }

            
        // Permet de scroll
        inscriptionScrollable.scrollBy(0,inscriptionScrollableHeight)
    }
    
    function secondContinue() {
        inscriptionScrollable.scrollBy(0,inscriptionScrollableHeight);

        if(input_status.value == "student" && document.getElementById("input-promotion").value == "2AFI") {
            document.getElementById("container-map").classList.toggle("d-none")
        }
        if (phone) {
            document.getElementById("label-ListVisibilityCheck").innerHTML = "Apparaître dans la listes des participants";
            document.getElementById("label-MapVisibilityCheck").innerHTML = "Apparaître sur la carte";
        }
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
function showError(element, error, typeWriterObject) {
    let container = document.getElementById(element + "_error_container");
    let image = document.getElementById(element + "_error_image");
    let text = document.getElementById(element + "_error_text");

    container.classList.toggle("tada");
    text.innerHTML = error;
    image.src = `${$APP_URL}/assets/images/creators/creator_error.png`;
    
    typeWriterObject
        .deleteAll(1)
        .typeString('Oops! Erreur!')
        .start()
}


const annuaire_status = document.getElementById("annuaire-status")
const annuaire_name = document.getElementById("annuaire-name")
const annuaire_promotion = document.getElementById("annuaire-promotion")
const annuaire_company = document.getElementById("annuaire-company")

annuaire_promotion.addEventListener("change", () => {
    if(annuaire_promotion.value == "2AFI") {
        annuaire_company.disabled = true;
    } else {
        annuaire_company.disabled = false;
    }
})

annuaire_status.addEventListener("change", () => {
    switch (annuaire_status.value) {
        case "":
            annuaire_promotion.disabled = false;
            annuaire_company.disabled = false;

            for(var i=0;i<=annuaire_promotion.options.length; i++) {
                annuaire_promotion.remove(0)
            }
            ["2AFA","2AFI","LP RIMS","LP CART","LP TSSR"].forEach( option => {
                annuaire_promotion.add(new Option(option,option),undefined)
            })
            for(var i = 1990; i<=2022; i++) {
                annuaire_promotion.add(new Option(`Promotion ${i}`,i),undefined)
            }
            annuaire_promotion.add(new Option("Toutes promotions","", true, true),0)
            annuaire_promotion.options[0].disabled = true;
            break;
        case "student":
            annuaire_promotion.disabled = false;
            annuaire_company.disabled = false;

            ["2AFA","2AFI","LP RIMS","LP CART","LP TSSR"].forEach( option => {
                annuaire_promotion.add(new Option(option,option),undefined)
            })
            for(var i = 1990;i<=2023; i++) {
                annuaire_promotion.remove(0)
            }
            annuaire_promotion.add(new Option("Toutes promotions","", true, true),0)
            annuaire_promotion.options[0].disabled = true;
            break;
        case "teacher":
            annuaire_promotion.disabled = true;
            annuaire_company.disabled = true;
            break;
        case "oldstudent":
            annuaire_promotion.disabled = false;
            annuaire_company.disabled = false;

            for(var i = 1990; i<=2022; i++) {
                annuaire_promotion.add(new Option(`Promotion ${i}`,i),undefined)
            }
            for(var i = 0;i<6; i++) {
                annuaire_promotion.remove(0)
            }
            annuaire_promotion.add(new Option("Toutes promotions","", true, true),0)
            annuaire_promotion.options[0].disabled = true;
            break;
        case "other":
            annuaire_company.disabled = false;
            annuaire_promotion.disabled = true;
            break;
    }
})