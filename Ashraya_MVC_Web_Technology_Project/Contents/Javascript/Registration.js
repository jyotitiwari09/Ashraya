if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}

function verify() {
    // Display message
    swal({
        title: "Verification Required!",
        text: "Redirecting to Verification Page",
        icon: "warning",
    });
    setTimeout(function () {
    });
    return false;
}

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
        //  location.replace("~/Views/CustomerModule/Customer_Login/Customer_Login.aspx");
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

function Password_Match() {
    var x = document.getElementById("Password").value;
    var y = document.getElementById("CPassword").value;
    if (x != y) {
        {
            swal({
                title: "Passwords Doesnt Match!",
                text: "",
                icon: "warning",
            });
            setTimeout(function () {
                // location.replace("~/Views/CustomerModule/Customer_Login/Customer_Login.aspx");
            }, 5000);
            return false;
        }
    }
}

function success() {
    swal({
        title: "Registered Successful!",
        text: "Check Mail For Your Details",
        icon: "success",
    });
    setTimeout(function () {
        location.replace("~/Views/CustomerModule/Customer_Login/Customer_Login.aspx");
    }, delay);
    return false;
}
function successx() {
    swal({
        title: "Registered Successful!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        location.replace("~/Views/CustomerModule/Customer_Login/Customer_Login.aspx");
    }, delay);
    return false;
}

function Confirm() {
    let today = new Date(),
 day = today.getDate(),
 month = today.getMonth() + 1, //January is 0
 year = today.getFullYear();
    if (day < 10) {
        day = '0' + day
    }
    if (month < 10) {
        month = '0' + month
    }
    today = year + '-' + month + '-' + day;
    var a = document.getElementById("DOB").setAttribute("max", today);


}