function Update() {
    // Display message
    swal({
        title: "Updated Successfully!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
    });
    return false;
}

function PassFail() {
    // Display message
    swal({
        title: "Passwords Doesnt Match!",
        text: "",
        icon: "error",
    });
    setTimeout(function () {
    });
    return false;
}

function Removex() {
    // Display message
    swal({
        title: "Cannot Remove Room!",
        text: "Room Already Booked By Customer",
        icon: "error",
    });
    setTimeout(function () {
    });
    return false;
}