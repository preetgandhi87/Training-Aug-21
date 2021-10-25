//Select City in modal
$(document).ready(function(){
    $(".city").click(function(){
      var selectCity = $("#selectedCity");
      selectCity.text($(this).attr("value"));
    })
  })

$(document).ready(function () {
    $.getJSON("http://127.0.0.1:5500/cars.json", function (result) {
        console.log(result.carsData);
        $.each(result.carsData, function (index, value) {
            $("#myTable").append($("<tr></tr>").append($(`<td><img src=${value.image}></td>`))
                .append($("<td></td>").text(value.name)).append($("<td></td>").text(value.owner))
                .append($("<td></td>").text(value.kms)).append($("<td></td>").text(value.type))
                .append($("<td></td>").text(value.amount)).append($("<td></td>").text(value.downpayment)));
        })
    })
})