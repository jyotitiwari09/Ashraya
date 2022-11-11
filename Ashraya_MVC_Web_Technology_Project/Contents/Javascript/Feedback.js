function Success() {
    // Display message
    swal({
        title: "Thank You For Your Feedback!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}