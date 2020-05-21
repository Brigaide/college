function passwordCheck() {
    var strengthName = document.getElementById("level");
    var password = document.getElementById("password").value;
    var passbar = document.getElementById("bar");
    var strength = 0;
    var length = 0;

    // Do not show anything when the length of password is zero.


    if (password.length > 7){
        strength += 1;
        length = 1;
    }

    if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)){
        strength += 1;
    }

    if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)){
        strength += 1;
    }

    if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)){
        strength += 1;
    }

    if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)){
        strength += 1;
    }


    if (length < 1){
        strengthName.innerHTML = "Too Short";
        passbar.style.width = "0%"
    }

    else{
        if (strength == 1){
            strengthName.innerHTML = "Poor";
            passbar.style.background = "red";
            passbar.style.width = "0%"
        }
        if (strength > 0 && strength < 3) {
            strengthName.innerHTML = "Poor";
            passbar.style.background = "red";
            passbar.style.width = "33%";
        } 
        else if (strength == 3) {
            strengthName.innerHTML = "Good";
            passbar.style.background = "yellow";
            passbar.style.width = "66%";
        } 
        else if (strength > 3){
            strengthName.innerHTML = "Strong";
            passbar.style.background = "green";
            passbar.style.width = "100%";
        }
    }
}
    