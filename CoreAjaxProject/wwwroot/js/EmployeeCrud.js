$(document).ready(function () {
    showCompData();
});

function showCompData() {

    var url = $("#urlEmployeeData").val();
    $.ajax({
        url: url,
        type: "GET",
        dataType: 'json',
        contentType: 'application/json;charset=utfs-8',
        success: function (result, status, xjr) {
            let object = "";
           

            $.each(result, function (index, item) {
                object += '<tr>';
                object += '<td>' + item.employeeId + '</td>';
                object += '<td>' + item.employeeName + '</td>';
                object += '<td>' + item.employeeTitle + '</td>';
                object += '<td>' + item.phoneNumber + '</td>';
                object += '<td>' + item.employeeStartDate + '</td>';
                object += '<td>' + item.employeeCompany+ '</td>';
                object += '<td>' + item.employeeSalary + '</td>';
                object += '<td><a href="#" class="btn btn-primary" onclick="EditEmployee(' + item.employeeId + ')">Düzenle<a/> || <a href ="#" class="btn btn-danger" onclick="DeleteEmp(' + item.employeeId + ');">Sil</a></td>';
                object += '</tr>'
            });
            $("#tableData").html(object);
        },
        error: function () {
            alert("Veriler Getirilemedi");
        }
    });
}

$("#btnAddEmployee").click(function () {

    clearTextBox();
    $("#EmployeeModal").modal('show');
    $("#EmpID").hide();
    $("#addEmp").css("display", "block");
    $('#updateEmp').css("display", "none");
    $("#EmployeeHeading").text("Personel Ekle").css("color", "red");

});
function AddEmp() {
    let ObjData = {
        employeeId: $("#EmpID").val(),
        employeeName: $("#EmpName").val(),
        employeeTitle: $("#EmpTitle").val(),
        phoneNumber: $("#EmpPhnNo").val(),
        employeeStartDate: $("#EmpSD").val(),
        employeeCompany: $("#EmpComp").val(),
        employeeSalary: $("#EmpSalry").val(),

    }
    $.ajax({
        url: "/Employee/AddEmployee",
        type: "Post",
        data: ObjData,
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        dataType: "Json",
        success: function () {

            alert("Personel Başarıyla eklendi")
            clearTextBox();
            HideModalPopUp();
            showCompData();
        },
        error: function () {
            alert("Kayıt Ekleme İşlemi başarısız oldu")

        }
    });
}
function clearTextBox() {

    $("EmpID").val();
    $("#EmpName").val('');
    $("#EmpTitle").val('');
    $("#EmpPhnNo").val('');
    $("#EmpSD").val('');
    $("#EmpComp").val('');
    $("#EmpSalry").val('');
}
function DeleteEmp(id) {
    if (confirm("Kaydı Silmek İstediğinize Emin Misiniz ?")) {
        $.ajax({
            url: `/Employee/DeleteEmployee?id=${id}`,
            type: 'Delete',
            success: function () {
                alert("Kayıt Başarıyla silindi")
                showCompData();
            },
            error: function () {
                alert("Silme İşlemi Başarısız")
            }
        })
    }
};

function EditEmployee(id) {

    $.ajax({
        url: `/Employee/GetEmployee?id=${id}`,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "Json",
        success: function (response) {
            $("#EmployeeModal").modal('show'),
                $("#EmpID").val(response.employeeId),
                $("#EmpName").val(response.employeeName),
                $("#EmpTitle").val(response.employeeTitle),
                $("#EmpPhnNo").val(response.phoneNumber),
                $("#EmpSD").val(response.employeeStartDate),
                $("#EmpComp").val(response.employeeCompany),
                $("#EmpSalry").val(response.employeeSalary),
                $("#addEmp").css("display", "none"),
                $("#updateEmp").css("display", "block"),
                $("#EmployeeHeading").text("Çalışan Bilgisi Güncelle");

        },
        error: function () {
            alert("Kayıt Başarısız");
        }

    })
};

function UpdateEmp() {

    let objData = {
        employeeId: $("#EmpID").val(),
        employeeName: $("#EmpName").val(),
        employeeTitle: $("#EmpTitle").val(),
        phoneNumber: $("#EmpPhnNo").val(),
        employeeStartDate: $("#EmpSD").val(),
        employeeCompany: $("#EmpComp").val(),
        employeeSalary: $("#EmpSalry").val(),

    };
    $.ajax({
        url: '/Employee/PostEmployee',
        type: "POST",
        data: objData,
        contentType: 'application/x-www-form-urlencoded;charset=utf-8;',
        dataType: 'json',
        success: function () {
            alert("Güncelleme İşlemi Başarılı");
            clearTextBox();
            HideModalPopUp();
            showCompData();
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error);
        }

    })

};


function HideModalPopUp() {
    $('#EmployeeModal').modal('hide');

}

function PageReload() {
    location.reload();
}