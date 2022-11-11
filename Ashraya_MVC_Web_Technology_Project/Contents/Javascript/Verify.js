function notify() {
    // Display message
    swal({
        title: "Check Mail!",
        text: "OTP Is sent On Your Respective Mail",
        icon: "warning",
    });
    setTimeout(function () {
       // location.replace("~/Views/Ashraya/Code/Code.aspx");
    }, 3000);
 
}

function exists() {
    // Display message
    swal({title: "You have Already Registered!",text: "",icon: "warning",});
}

function XXX() {
    // Display message
    swal({
        title: "This Email Doesnt Exists!",
        text: "Please Check Your Email Properly",
        icon: "error",
    });
    setTimeout(function () {
        // location.replace("~/Views/Ashraya/Code/Code.aspx");
    }, 3000);

}