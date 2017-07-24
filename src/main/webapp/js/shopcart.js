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

            //显示购物车
            build_cart_table(result);
        }
    });
}

/*
* <tr>
 <td class="product-remove product-remove_2"><a href=""
 class="delete-goods"
 data-goodsid="用户id">×</a></td>
 <td class="product-thumbnail product-thumbnail-2"><a
 href="#"><img
 src="Images/goods/.jpg"
 alt="" /></a></td>
 <td class="product-name product-name_2"><a
 href="./detail.jsp?goodsid=商品id">名</a></td>
 <td class="product-price"><span
 class="amount-list amount-list-2">￥价格
 总价</span></td>
 <td class="product-stock-status">
 <div class="latest_es_from_2">
 <input type="number" value="1">
 </div>
 </td>
 <td class="product-price"><span
 class="amount-list amount-list-2">￥价格</span></td>
 </tr>
 <tr>
* */

function build_cart_table(result) {
    var goods = result.info.shopcart;
    $.each(goods, function (index,item) {
        var deleteCart = $("<td></td>").addClass("product-remove product-remove_2")
            .append($("<a></a>").addClass("delete-goods").attr("data-goodsid",item.goodsid).append("×"));
        var goodsImage = $("<td></td>").addClass("product-thumbnail product-thumbnail-2")
            .append($("<a></a>").attr("href","/shop/detail?goodsid="+item.goodsid)
                .append($("<img/>").attr("src","/goodsimage/"+item.imagePaths[0].path)));
        var goodsname = $("<td></td>").addClass("product-name product-name_2")
            .append($("<a></a>").attr("href","/shop/detail?goodsid="+item.goodsid).append(item.goodsname));
        var price = $("<td></td>").addClass("product-price")
            .append($("<span></span>").addClass("amount-list amount-list-2").append("￥"+item.price));
        var num = $("<td></td>").addClass("product-stock-status")
            .append($("<div></div>").addClass("latest_es_from_2")
                .append($("<input/>").attr("type","number").attr("value",item.num)));
    });

}
