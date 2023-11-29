$(document).ready(function () {
    showCompData();
});

function showCompData() {

    var url = $("#urlCompanyData").val();
    $.ajax({
        url: url,
        type: "GET",
        dataType: 'json',
        contentType: 'application/json;charset=utfs-8',
        success: function (result, status, xjr) {
            let object = "";
            $.each(result, function (index, item) {
                object += '<tr>';
                object += '<td>' + item.companyNo + '</td>';
                object += '<td>' + item.companyName + '</td>';
                object += '<td>' + item.description + '</td>';
                object += '<td>' + item.contactName + '</td>';
                object += '<td>' + item.contactPhone + '</td>';
                object += '<td>' + item.taxAdministration + '</td>';
                object += '<td><a href="#" class="btn btn-primary" onclick="EditCompany(' + item.companyNo + ')">Düzenle<a/> || <a href ="#" class="btn btn-danger" onclick="DeleteCompany(' + item.companyNo + ');">Sil</a></td>';
                object += '</tr>'
            });
            $("#tableData").html(object);

        },
        error: function () {
            alert("Veriler Getirilemedi");
        }

    });
}

$("#btnAddCompany").click(function () {

    clearTextBox();
    $("#CompanyModal").modal('show');
    $("#CompID").hide();
    $("#addComp").css("display", "block");
    $('#updateComp').css("display", "none");
    $("#CompanyHeading").text("Firma Ekle").css("color", "red");

});
function AddComp() {
    let ObjData = {
        companyNo: $("#CompanyID").val(),
        companyName: $("#CompName").val(),
        description: $("#Desc").val(),
        contactName: $("#Contct").val(),
        contactPhone: $("#ContctPhn").val(),
        taxAdministration: $("#Tax").val(),

    }
    $.ajax({
        url: "/Company/AddCompany",
        type: "Post",
        data: ObjData,
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        dataType: "Json",
        success: function () {

            alert("Firma Başarıyla eklendi")
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


    $("").val();
    $("#CompName").val('');
    $("#Desc").val('');
    $("#Contct").val('');
    $("#ContctPhn").val('');
    $("#Tax").val('');
}
function DeleteCompany(id) {
    if (confirm("Kaydı Silmek İstediğinize Emin Misiniz ?")) {
        $.ajax({
            url: `/Company/DeleteCompany?id=${id}`,
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

function EditCompany(id) {
   
    $.ajax({
        url: `/Company/GetCompany?id=${id}`,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "Json",
        success: function (response) {
            $("#CompanyModal").modal('show'),
                $("#CompanyID").val(response.companyNo),
                $("#CompName").val(response.companyName),
                $("#Desc").val(response.description),
                $("#Contct").val(response.contactName),
                $("#ContctPhn").val(response.contactPhone),
                $("#Tax").val(response.taxAdministration),
                $("#addComp").css("display", "none"),
                $("#updateComp").css("display", "block"),
                $("#CompanyHeading").text("Firma Bilgisi Güncelle");

        },
        error: function () {
            alert("Kayıt Başarısız");
        }

    })
};

function UpdateComp() {

    let objData = {
        companyNo: $("#CompanyID").val(),
        companyName: $("#CompName").val(),
        description: $("#Desc").val(),
        contactName: $("#Contct").val(),
        contactPhone: $("#ContctPhn").val(),
        taxAdministration: $("#Tax").val(),
    };
    $.ajax({
        url: '/Company/UpdateCompany',
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
    $('#CompanyModal').modal('hide');

}

