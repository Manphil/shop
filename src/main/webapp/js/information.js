$(document).ready(function(){
    $("#name").val($("#nameVal").text());
    $("#email").val($("#emailVal").text());
    $("#telephone").val($("#telephoneVal").text());
    $("#changeInfo").click(function(){
        $("#update-info").modal({
            backdrop:'static'
        });
    });

    $("#saveInfo").click(function (){
        var saveInfo={};
        saveInfo.name=$("#name").val();
        saveInfo.email=$("#email").val();
        saveInfo.telephone=$("#telephone").val();
        $.ajax({
            type: "POST",
            url: "/shop/saveInfo",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            data:saveInfo,
            dateType:"json",
            success: function(result){
                $("#update-goods").modal('hide');
                if (result.msg=="更新失败")
                {
                    swal(result.msg);
                }
                else {
                    location.reload();
                };
            },
            error:function (){
                alert("更新失败");
            }
        });
    });
});
