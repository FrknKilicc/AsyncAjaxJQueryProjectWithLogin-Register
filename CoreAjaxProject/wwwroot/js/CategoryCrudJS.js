$(document).ready(function () {
    showCategoryData();
});

function showCategoryData() {
    let url = $("#urlCategoryData").val();
    $.ajax({
        url: url,
        type: "GET",
        dataType: 'json',
        contentType: 'application/json;charset=utfs-8',
        success: function (result, status, xjr) {
            let object = "";
            $.each(result, function (index, item) {
                object += '<tr>';
                object += '<td>' + item.categoryId + '</td>';
                object += '<td>' + item.categoryName + '</td>';
                object += '<td>' + item.description + '</td>';
                object += '<td><a href="#" class="btn btn-primary" onclick="EditCategory(' + item.categoryId + ')">Düzenle<a/> || <a href ="#" class="btn btn-danger" onclick="DeleteCategory(' + item.categoryId + ');">Sil</a></td>';
                object += '</tr>'
            });
            $("#tableData").html(object);
        },
        error: function () {
            alert("Veriler Getirilemedi");
        }

    });
}

$("#btnAddCategory").click(function () {
    clearTextBox();
    $("#CategoryModal").modal('show');
    $("#CatID").hide();
    $("#addCategory").css("display", "block");
    $('#updateCategory').css("display", "none");
    $("CategoryHeading").text("Kategori Ekle").css("color", "red");

});
function AddCategory() {
    let ObjData = {
        categoryName: $("#CatName").val(),
        description: $("#CatDesc").val()
    }
    $.ajax({
        url: "/categories/AddCategory",
        type: "Post",
        data: ObjData,
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        dataType: "Json",
        success: function () {

            alert("Kategori Başarıyla eklendi")
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
    $("#CategoryyID").val('');
    $("#CatName").val('');
    $("#CatDesc").val('');
}
function DeleteCategory(id) {
    if (confirm("Kaydı Silmek İstediğinize Emin Misiniz ?")) {
        $.ajax({
            url: `/categories/DeleteCategory?id=${id}`,
            type: 'Delete',
            success: function () {
                alert("Kayıt Başarıyla silindi")
                showCompData()
            },
            error: function () {
                alert("Silme İşlemi Başarısız")
            }
        })
    }
};

function EditCategory(id) {

    $.ajax({
        url: `/Categories/GetCategory?id=${id}`,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "Json",
        success: function (response) {
            $("#CategoryModal").modal('show'),
                $("#CategoryyID").val(response.categoryId),
                $("#CatName").val(response.categoryName),
                $("#CatDesc").val(response.description),
                $("#addCategory").css("display", "none"),
                $("#updateCategory").css("display", "block"),
                $("#CategoryHeading").text("Kategori Güncelle");

        },
        error: function () {
            alert("Kayıt Başarısız");
        }

    })
};

function UpdateCat() {

    let objData = {

        categoryId: $("#CategoryyID").val(),
        categoryName: $("#CatName").val(),
        description: $("#CatDesc").val()
    };
    $.ajax({
        url: '/Categories/UpdateCategory',
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
    $('#CategoryModal').modal('hide');
}

