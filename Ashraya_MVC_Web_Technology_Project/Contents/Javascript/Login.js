function phonerror() {
    // Display message
    swal({
        title: "Phone Number Already Exists!",
        text: "",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}
function emailerror() {
    // Display message
    swal({
        title: "Email Already Exists!",
        text: "",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function usernameerror() {
    // Display message
    swal({
        title: "Username Already Exists!",
        text: "",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function Email_Error() {
    swal("Email Doesnt Exists!", "", "error");
    return false;
}
function Password_Error() {
    swal("Incorrct password!", "", "error");
    return false;
}
function Login_Success() {
    swal("Login Successful!", "", "success");
    return false;
}

