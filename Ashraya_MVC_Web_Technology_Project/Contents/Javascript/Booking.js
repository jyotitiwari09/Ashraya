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
    document.getElementById('CheckInDate').setAttribute("min", today);
    document.getElementById('CheckOutDate').setAttribute("min", today);
}
function HJ() {
    var x = document.getElementById("CheckInDate").value;
    var y = document.getElementById("CheckOutDate").value;
    if (x == y) {
        swal({
            title: "CheckIn Date & CheckOut Date Cannot Be On Same Day!",
            text: "",
            icon: "error",
        });
        return false;
    }
    if (x > y) {
        swal({
            title: "CheckIn Date Cannot Be Greater Than CheckOut Date!",
            text: "",
            icon: "warning",
        });
        return false;
    }
}