function Delete() {
    // Display message
    swal({
        title: "PG Deleted Successfully!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function CannotDelete() {
    // Display message
    swal({
        title: "Cannot Delete!",
        text: "Room are Existing",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function CannotDelete2() {
    // Display message
    swal({
        title: "PG Doesnt Exists!",
        text: "",
        icon: "error",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}