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
}