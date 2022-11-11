function Exists() {
    // Display message
    swal({
        title: "Room Already Booked!",
        text: "",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}