function NoDeleteOwner()
{
    swal({
        title: "Cannot Remove!",
        text: "Pg Is Existing",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function NoDeleteCustomer() {
    swal({
        title: "Cannot Remove!",
        text: "Booking is Existing",
        icon: "warning",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}

function Delete()
{
    swal({
        title: "Deleted Successfully!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}