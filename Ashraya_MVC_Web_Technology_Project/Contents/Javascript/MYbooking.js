function Success() {
    // Display message
    swal({
        title: "Booking Deleted Successfully!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}