const phone = window.innerWidth < 1000
var currentPage = document.querySelector("title").innerHTML
console.log(currentPage)
///////////////////////////////////////////// FORMS ///////////////////////////////////////////////////////// 

// Affichage du mot de passe dans le input ( icone d'oeil )

const passwordInputIcons = document.querySelectorAll(".password-input-icon")


if(passwordInputIcons != null) {
    passwordInputIcons.forEach(icon => {
        icon.addEventListener("click", () => {
            // Parent of the dive
            let parent = icon.closest("div")
    
            // Child of type input
            let input = parent.querySelector("input")
    
            if (input.type === "text") {
                input.type = "password"
                icon.src = "/assets/images/svg/password-hidden.svg"
            } else {
                input.type = "text"
                icon.src = "/assets/images/svg/password-show.svg"
            }
        })
    })
}

// Compte à rebours

let countdownDate = new Date("Jul 7 2023 19:00:00").getTime()
const countdownDay = document.getElementById("countdown-days")
const countdownHour = document.getElementById("countdown-hours")
const countdownMinute =  document.getElementById("countdown-minutes")
const countdownSecond =  document.getElementById("countdown-seconds")

function countdown() {
    let currentDate = new Date().getTime()
    
    let difference = countdownDate - currentDate

    let days = Math.floor(difference / (1000 * 60 * 60 * 24)).toString()
    let hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)).toString()
    let minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60)).toString()
    let seconds = Math.floor((difference % (1000 * 60)) / 1000).toString()

    if(days.toString().length === 1 ) {
        days = "0" + days
    } 
    if(hours.toString().length === 1 ) {
        hours = "0" + hours
    } 
    if(minutes.toString().length === 1 ) {
        minutes = "0" + minutes
    } 
    if(seconds.toString().length === 1 ) {
        seconds = "0" + seconds
    }

    countdownDay.innerHTML = days
    countdownHour.innerHTML = hours
    countdownMinute.innerHTML = minutes
    countdownSecond.innerHTML = seconds

    setTimeout(countdown, 1000)
}

//////////////////////////////////////////////////// CONNECTION ////////////////////////////////////////////////////

// Affichage du formulaire de connexion

var openModal = function(identifier, source=null) {
    let modal = document.getElementById(identifier)

    if(source != null) {
        document.getElementById("gallery-modal-photo").src = source
        document.getElementById("gallery-photo-download").href = source
    }

    modal.style.display = "block"
    setTimeout(() => {modal.style.opacity = "1"}, 1)
    document.body.style.overflow = "hidden"
}

function closeModal(identifier) {
    let modal = document.getElementById(identifier)

    if(identifier === "connection-modal") {
        connectionScroll("up")
        document.querySelectorAll(".connection-form").forEach(element => {
            element.reset()
        })
    }
    modal.style.opacity = "0"
    setTimeout(() => {modal.style.display = "none"}, 750)
    document.body.style.overflow = "auto"
}


if(currentPage == "Accueil") {
    countdown()
}

// Scroll dans le formulaire de connexion

function connectionScroll(direction) {
    let connectionWindow = document.getElementById("connection-window")
    let passwordWindowHeight = document.getElementById("password-reinitialise").offsetHeight
    
    if(direction === "down") {
        connectionWindow.scrollBy(0, 9999)
        if(!phone) {
            connectionWindow.style.height = `${passwordWindowHeight}px`
        }
    } else if(direction === "up") {
        connectionWindow.scrollBy(0, -9999)
        if(!phone) {
            connectionWindow.style.height = "75vh"
        }
    }
}

/////////////////////////////// INSCRIPTION /////////////////////////////////////

// Si on est sur la page de inscription, alors tout ce code est chargé
if(document.getElementById("inscription-container") != null){
    // Variables pour le scroll
    var inscriptionScrollable = document.getElementById("inscription-scrollable")
    window.inscriptionScrollableHeight = inscriptionScrollable.offsetHeight

    function scrollRegister() {
        // Permet de scroll
        inscriptionScrollable.scrollBy(0,window.inscriptionScrollableHeight)
    }

    function firstContinue() {
        let input_status = document.getElementById("input-status")

        if (phone) {
            document.getElementById("label-ListVisibilityCheck").innerHTML = "Apparaître dans la listes des participants"
        }
        
        let container_promotion = document.getElementById("container-promotion")
        let input_promotion = document.getElementById("input-promotion")
        
        let input_email = document.getElementById("input-email")
        let container_oldpromotion = document.getElementById("container-oldpromotion")
        let input_oldpromotion = document.getElementById("input-oldpromotion")

        let container_company = document.getElementById("container-company")
        let input_company = document.getElementById("input-company")

        let container_family = document.getElementById("container-family")
        let input_checkfamily = document.getElementById("input-checkfamily")
        let input_countfamily = document.getElementById("input-countfamily")

        switch (input_status.value) {
            case "student":
                container_promotion.classList.toggle("d-none")
                input_promotion.disabled = false

                container_company.classList.toggle("d-none")
                input_promotion.addEventListener("change", () => {
                    input_company.disabled = input_promotion.value == "2AFI"
                })

                container_family.classList.toggle("d-none")
                input_checkfamily.addEventListener("change", () => {
                    input_countfamily.disabled = !input_checkfamily.checked
                })

                if(phone){
                    input_email.placeholder = "Adresse mail universitaire"
                    let possibleOptions = ["BUT R&T 2 FI", "BUT R&T 2 FA", "LP CART", "LP RIMS", "LP TSSR"]
                    let options = input_promotion.children
            
                    for(i = 0; i < options.length; i++) {
                        options[i].text = possibleOptions[i]
                    }
                } else {
                    input_email.placeholder = "Adresse mail universitaire (@etudiant.univ-rennes1.fr)"
                }
                break
            case "teacher":
                if(phone) {
                    input_email.placeholder = "Adresse mail universitaire"
                } else {
                    input_email.placeholder = "Adresse mail universitaire (@univ-rennes1.fr)"
                }
                    
                break
            case "oldstudent":                
                container_oldpromotion.classList.toggle("d-none")
                input_oldpromotion.disabled = false

                container_company.classList.toggle("d-none")
                input_company.disabled = false
                break
            case "other":
                container_company.classList.toggle("d-none")
                input_company.disabled = false
                break
            }

        // Permet de scroll
        scrollRegister()
    }
}
/////////////////////////////////// HEADER //////////////////////////////

const navbar = document.querySelector("header")
const navbarToggler = document.getElementById("navbar-toggler")
const headerBackground = document.getElementById("header-background-scroll")

navbarToggler.addEventListener("click", () => {
    navbar.classList.toggle("toggle")
    if(navbar.classList.contains("toggle")) {
        navbar.style.backgroundColor = "var(--blue)"
    } else {
        navbar.style.backgroundColor = "transparent"
    }
})

window.addEventListener("scroll", () => {
    if(window.scrollY > 200) {
        headerBackground.style.height = "100%"
    } else {
        headerBackground.style.height = "0%"
    }
})

if(window.scrollY > 200) {
    headerBackground.style.height = "100%"
}

////////////////////// GALLERIE /////////////////////////////

// Animation lors du chargement de la page ( title wrapper )

function titleAnimation(identifier) {
    let title = document.getElementById(identifier)
    let letters = title.children

    for(let i = 0; i < letters.length; i++) {
        setTimeout( () => {
            letters[i].style.transform = "translateY(0)"
            letters[i].style.opacity = "1"
        }, i*75)
    }   
}

const gallery = document.getElementById("gallery")

if(gallery != null) {
    if(gallery.children.length === 0) {
        gallery.innerHTML = "<span class='inscription-info-text text-white'>Une fois la cérémonie passée, les photos apparaitront ici.</span>"
    }

    // Submit automatique gallerie
    document.getElementById("input-file").addEventListener("input", () => {
        document.getElementById("input-file-form").submit()
    })
}

const images = document.querySelectorAll(".gallery-image-wrapper")

if(images != null) {
    images.forEach( image => {
        image.addEventListener("click", () => {
            let photo = image.children[0].src

            openModal("gallery-modal", photo)
        })
    })
}

/////////////////////////// ORGANISATION ///////////////////////

const timelineIcons = document.querySelectorAll(".timeline-icon")

if(phone && timelineIcons != null) {
    timelineIcons.forEach(icon => {
        icon.classList.toggle("fa-5x")
        icon.classList.toggle("fa-2x")
    })
}

// NOTIFICATIONS

const notification = document.getElementById("notification-wrapper")
const closeNotificationButton = document.getElementById("closeNotificationButton")

function closeNotification() {
    notification.style.transform = "translateY(-50px)"
    notification.style.opacity = "0"
    setTimeout( () => {notification.style.display = "none"}, 500)
}

function openNotification() {
    notification.style.transform = "translateY(0)"
    notification.style.opacity = "1"
}

if(notification != null) {
    closeNotificationButton.addEventListener("click", () => {
        closeNotification()
    })
    openNotification()
}

// Prends un array d'identifiants en parametres, 0 - error container, 1 - error img, 2 - error title ( objet typewriter ), 3 - error text
function showError(element, error, typeWriterObject) {
    let container = document.getElementById(element + "_error_container")
    let image = document.getElementById(element + "_error_image")
    let text = document.getElementById(element + "_error_text")

    container.classList.toggle("tada")

    text.innerHTML = error
    image.src = "/assets/images/creators/creator_error.png"
    
    typeWriterObject
        .deleteAll(1)
        .typeString('Oops! Erreur!')
        .start()
}

if(document.getElementById("annuaire-form") != null) {
    const annuaire_status = document.getElementById("annuaire-status")
    const annuaire_promotion = document.getElementById("annuaire-promotion")
    const annuaire_company = document.getElementById("annuaire-company")
    
    annuaire_promotion.addEventListener("change", () => {
        if(annuaire_promotion.value == "2AFI") {
            annuaire_company.disabled = true
        } else {
            annuaire_company.disabled = false
        }
    })
    
    annuaire_status.addEventListener("change", () => {
        switch (annuaire_status.value) {
            case "":
                annuaire_promotion.disabled = false
                annuaire_company.disabled = false

                while (annuaire_promotion.options.length > 0) {                
                    annuaire_promotion.remove(0)
                } 
                ["2AFA","2AFI","LP RIMS","LP CART","LP TSSR"].forEach( option => {
                    annuaire_promotion.add(new Option(option,option),undefined)
                })
                for(var i = 1990; i<=2022; i++) {
                    annuaire_promotion.add(new Option(`Promotion ${i}`,i),undefined)
                }
                annuaire_promotion.add(new Option("Toutes promotions","", true, true),0)
                break
            case "student":
                annuaire_promotion.disabled = false
                annuaire_company.disabled = false
    
                while (annuaire_promotion.options.length > 0) {                
                    annuaire_promotion.remove(0)
                }
                ["2AFA","2AFI","LP RIMS","LP CART","LP TSSR"].forEach( option => {
                    annuaire_promotion.add(new Option(option,option),undefined)
                })
                annuaire_promotion.add(new Option("Toutes promotions","", true, true),0)
                break
            case "teacher":
                annuaire_promotion.disabled = true
                annuaire_company.disabled = true
                break
            case "oldstudent":
                annuaire_promotion.disabled = false
                annuaire_company.disabled = false
    
                while (annuaire_promotion.options.length > 0) {                
                    annuaire_promotion.remove(0)
                }
                for(var i = 1990; i<=2022; i++) {
                    annuaire_promotion.add(new Option(`Promotion ${i}`,i),undefined)
                }
                annuaire_promotion.add(new Option("Toutes promotions","", true, true),0)
                annuaire_promotion.options[0].disabled = true
                break
            case "other":
                annuaire_company.disabled = false
                annuaire_promotion.disabled = true
                break
        }
    })
}

if (document.getElementById("goldbook-input") != null) {
    let input = document.getElementById("goldbook-input")
    let limit = document.getElementById("goldbook-limit")
    
    input.addEventListener("focus", () => {
        limit.style.transform = "translate(0, 0)"
        limit.style.opacity = "1"
    })

    input.addEventListener("focusout", () => {
        limit.style.transform = "translate(0, 100%)"
        limit.style.opacity = "0"
    })

    input.addEventListener("input", () => {
        limit.textContent = `${input.value.length}/${input.maxLength}`

        if(input.value.length == 150) {
            limit.classList.add("tada")
            limit.style.color = "red"
        } else {
            limit.classList.remove("tada")
            limit.style.color = "var(--bonewhite)"
        }
    })
}

function goldbookScroll() {
    let wrapper = document.getElementById("goldbook-content")
    wrapper.scrollTop = wrapper.scrollHeight
}

if(!!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/)) {
    document.querySelectorAll(".wave").forEach(wave => {
        wave.style.display = "none"
    })
}