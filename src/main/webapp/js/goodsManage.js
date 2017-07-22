/**
 * Created by 文辉 on 2017/7/22.
 */
$(document).ready(function () {

    var path = $("#path").text();
    alert(path);

    $.ajax({
        url:path+"/admin/goods/showjson",
        data:"page=1",
        type:"get",
        success:function (result) {
            console.log(result);
        }
    })

    $(".templatemo-delete-btn").click(function () {
        var goodsname = $(this).parents("tr").find("td:eq(1)").text();
        var goodsid = $(this).parents("tr").find("td:eq(0)").text();
        window.location.reload();
        swal({
                title: "确定删除" + goodsname + "吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定删除！",
                closeOnConfirm: false
            },
            function () {
                /*swal("删除！", "你的虚拟文件已经被删除。", "success");*/
                $.ajax({
                    url: "/admin/goods/delete/" + goodsid,
                    type: "DELETE",
                    success:function (result) {
                        swal("删除成功！", "","success");
                    }
                });
            });
    });
});