/*
$(document).ready(function(){
	$('.delete-goods').click(function(){
		var goodsid = $(this).attr("data-goodsid");
		deleteGoods(goodsid);
	});

	$('.confirm-orders').click(function(){
		confirmOrders();
		alert("已成功加入订单，并已发送邮件至卖家，请等待卖家回复！");
		location.href = "/index.jsp";
	});
});

function deleteGoods(goodsid){
	$.post("servlet/DeleteCartServlet", { 
		goodsId: goodsid,
	});
}

function confirmOrders(){
	$.post("servlet/SaleServlet");
}*/
$(document).ready(function () {
    var path = $("path").text();
   showcart();
});

function showcart() {
    $.ajax({
        url: path + "/cartjson",
        type: "post",
        success: function (result) {

            //解析显示
            build_user_table(path, result);

            //页面信息
            build_page_info(path, result);

            //分页
            build_page_nav(path, result);

            currentPage = page;
        }
    });
}
