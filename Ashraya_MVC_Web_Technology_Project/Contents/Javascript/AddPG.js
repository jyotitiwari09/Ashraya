function Success() {
    // Display message
    swal({
        title: "PG Added Successfully!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}