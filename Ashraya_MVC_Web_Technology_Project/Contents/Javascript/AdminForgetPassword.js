function Update() {
    swal({
        title: "Password Updated Successfully!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function UpdateFail() {
    swal({
        title: "Old Password Doesnt Match!",
        text: "",
        icon: "error",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}


function NoMatch() {
    swal({
        title: "Password Doesnt Match!",
        text: "New and Confirm Password Mismatches",
        icon: "error",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}