function Pass() {
    // Display message
    swal({
        title: "OTP Verified!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}
function Fail() {
    // Display message
    swal({
        title: "Incorrect OTP!",
        text: "",
        icon: "error",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function Email() {
    // Display message
    swal({
        title: "Check Mail!",
        text: "Please Use the Password From Email To Log In",
        icon: "info",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function WrongEmail() {
    // Display message
    swal({
        title: "Wrong Email!",
        text: "",
        icon: "error",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}