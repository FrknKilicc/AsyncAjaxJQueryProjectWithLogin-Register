$(document).ready(function () {
    showCompData();
});

function showCompData() {

    var url = $("#urlProductsData").val();
    $.ajax({
        url: url,
        type: "GET",
        dataType: 'json',
        contentType: 'application/json;charset=utfs-8',
        success: function (result, status, xjr) {
            let object = "";


            $.each(result, function (index, item) {
                object += '<tr>';
                object += '<td>' + item.productId + '</td>';
                object += '<td>' + item.stockCode + '</td>';
                object += '<td>' + item.barcode + '</td>';
                object += '<td>' + item.productName + '</td>';
                object += '<td>' + item.quantity + '</td>';
                object += '<td>' + item.brand + '</td>';
                object += '<td>' + item.categoryID + '</td>';
                object += '<td><a href="#" class="btn btn-primary" onclick="EditProducts(' + item.productId + ')">Düzenle<a/> || <a href ="#" class="btn btn-danger" onclick="DeletePrd(' + item.productId + ');">Sil</a></td>';
                object += '</tr>'
            });
            $("#tableData").html(object);
        },
        error: function () {
            alert("Veriler Getirilemedi");
        }
    });
}

$("#btnAddProduct").click(function () {

    clearTextBox();
    $("#ProdutcsModal").modal('show');
    $("#PrdID").hide();
    $("#addPrd").css("display", "block");
    $('#updatePrd').css("display", "none");
    $("#ProductsHeading").text("Ürün Ekle").css("color", "red");

});
function AddPrd() {
    let ObjData = {
        productId: $("#PrdID").val(),
        stockCode: $("#PrdSC").val(),
        barcode: $("#PrdBarcode").val(),
        productName: $("#PrdName").val(),
        quantity: $("#PrdQuantity").val(),
        brand: $("#PrdBrnd").val(),
        categoryID: $("#PrdCat").val(),

    }
    $.ajax({
        url: "/Products/AddProducts",
        type: "Post",
        data: ObjData,
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        dataType: "Json",
        success: function () {

            alert("Ürün Başarıyla eklendi")
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

    $("PrdID").val();
    $("#PrdSC").val('');
    $("#PrdBarcode").val('');
    $("#PrdName").val('');
    $("#PrdQuantity").val('');
    $("#PrdBrnd").val('');
    $("#PrdCat").val('');
}
function DeletePrd(id) {
    if (confirm("Kaydı Silmek İstediğinize Emin Misiniz ?")) {
        $.ajax({
            url: `/Products/DeleteProducts?id=${id}`,
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

function EditProducts(id) {

    $.ajax({
        url: `/Products/GetProducts?id=${id}`,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "Json",
        success: function (response) {
            $("#ProdutcsModal").modal('show'),
                $("#PrdID").val(response.productId),
                $("#PrdSC").val(response.stockCode),
                $("#PrdBarcode").val(response.barcode),
                $("#PrdName").val(response.productName),
                $("#PrdQuantity").val(response.quantity),
                $("#PrdBrnd").val(response.brand),
                $("#PrdCat").val(response.categoryID),
                $("#addPrd").css("display", "none"),
                $("#updatePrd").css("display", "block"),
                $("#ProductsHeading").text("Ürün Bilgisi Güncelle");

        },
        error: function () {
            alert("Kayıt Başarısız");
        }

    })
};

function UpdatePrd() {

    let objData = {
        productId: $("#PrdID").val(),
        stockCode: $("#PrdSC").val(),
        barcode: $("#PrdBarcode").val(),
        productName: $("#PrdName").val(),
        quantity: $("#PrdQuantity").val(),
        brand: $("#PrdBrnd").val(),
        categoryID: $("#PrdCat").val(),

    };
    $.ajax({
        url: '/Products/PostProducts',
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
    $('#ProdutcsModal').modal('hide');

}

function PageReload() {
    location.reload();
}