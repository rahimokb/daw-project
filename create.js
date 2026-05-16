function Validation_infos(event) {
     let valid = true;
     let fname = document.getElementById("first-name").value;
    let lname = document.getElementById("last-name").value;
    let email = document.getElementById("email").value;
    let address = document.getElementById("address").value;
    let age = parseInt(document.getElementById("age").value);
    let phone = document.getElementById("phone_number").value;
    let password = document.getElementById("password").value;
    let passcon=document.getElementById("pascon").value;
    const wilaya = document.getElementById("wilaya").value;
    let mescon= document.getElementById("mescon");
    let confirmation = document.getElementById("confirmation-message");
    let passwordError = document.getElementById("password-error");
    let phoneError = document.getElementById("phone-error");
    let agerror = document.getElementById("age-error");
    let ferror = document.getElementById("fname-error");
    let lerror = document.getElementById("lname-error");
    let eerror = document.getElementById("email-error");
    let aerror = document.getElementById("address-error");

    if (fname === "") {
        ferror.innerText = "First Name is required.";
        valid = false;
    } else {
        ferror.innerText = "";
    }

    if (lname === "") {
        lerror.innerText = "Last Name is required.";
        valid = false;
    } else {
        lerror.innerText = "";
    }

    if (email === "") {
        eerror.innerText = "Email is required.";
        valid = false;
    } else {
        eerror.innerText = "";
    }

    if (address === "") {
        aerror.innerText = "Address is required.";
        valid = false;
    } else {
        aerror.innerText = "";
    }

    if (isNaN(age) || age < 17 || age > 100) {
        agerror.innerText = "Age must be between 17 and 100.";
        valid = false;
    } else {
        agerror.innerText = "";
    }

    let phonePattern = /^[0-9]{9,10}$/;
    if (!phonePattern.test(phone)) {
        phoneError.innerText = "Phone number must be 9 or 10 digits.";
        valid = false;
    } else {
        phoneError.innerText = "";
    }

    if (password === "") {
        passwordError.innerText = "Password is required.";
        event.preventDefault();
        valid = false;
    } else if (password.length < 8) {
        passwordError.innerText = "Password must be at least 8 characters long.";
        event.preventDefault();
        valid = false;
    } else {
        passwordError.innerText = "";
    }
    if (passcon.trim() === "") {
      mescon.innerHTML="password confirmation";
      event.preventDefault();
      passcon.style.border = "2px solid red";
      valid= false;
  } else if (passcon !== password) {
      mescon.innerHTML="password not match";
      event.preventDefault();
      passcon.style.border = "2px solid red";
      valid = false;
  } else {
      mescon.style.border = "";
  }
    if (wilaya==="") {
        confirmation.innerText = "Veuillez sélectionner une Wilaya.";
        valid = false;
    }
    if(!valid){
      event.preventDefault();
    }
    return valid;
}

function updateTotal() {
  const quantity = parseInt(document.getElementById("quantity").value) || 0;
  const unitPrice = parseInt(document.getElementById("unit-price").dataset.price);
  const total = quantity * unitPrice;
  document.getElementById("total-price").innerText = total + " DA";
}
function updateTotal() {
  const quantity = parseInt(document.getElementById("quantity").value) || 0;
  const unitPrice = parseInt(document.getElementById("unit-price").dataset.price);
  const total = quantity * unitPrice;
  document.getElementById("total-price").innerText = total + " DA";
}
function validateCommande(event) {
    event.preventDefault();
    let valid = true;
    let checkboxes = document.querySelectorAll('input[name="color[]"]:checked');
    let error = document.getElementById("color-error");
    if (checkboxes.length === 0) {
        error.innerText = "Please choose at least one color!";
        valid = false;
    } else {
        error.innerText = "";
    }
    let quantity = document.getElementById("quantity");
    let quantityError = document.getElementById("quantity-error");
    if (quantity.value === "" || quantity.value <= 0) {
        quantityError.innerHTML = "Veuillez entrer une quantité valide";
        valid = false;
    } else {
        quantityError.innerHTML = "";
    }
    let pointure = document.getElementById("pointure");
    let pointureError = document.getElementById("pointure-error");
    if (pointure.value === "") {
        pointureError.innerHTML = "Veuillez entrer la pointure";
        valid = false;
    } else if (pointure.value < 37 || pointure.value > 44) {
        pointureError.innerHTML = "La pointure doit être entre 37 et 44";
        valid = false;
    } else {
        pointureError.innerHTML = "";
    }
    if (valid) {
        const confirmOrder = confirm("Êtes-vous sûr de vouloir valider la commande?");
        if (confirmOrder) {
            document.querySelector("form").submit();
        }
    }

    return valid;
}


