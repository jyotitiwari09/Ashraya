function Empty() {
    swal(
        " ", {
        button: false,
        closeOnClickOutside: false,
        icon: "warning",
        title: "There is No Record!",
    
    });

}

function Deleted() {
    swal({
        title: "Deleted!",
        text: "",
        icon: "success",
    });
    setTimeout(function () {
        //  location.replace("/Login/Login.aspx");
    }, delay);
    return false;
}