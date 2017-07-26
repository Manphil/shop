$(document).ready(function(){
	
	//分类栏隐藏显示
	$(".list-group-item").hover(function(){
		$(this).children("div.sort-detail").show();
	},function(){
		$(this).children("div.sort-detail").delay(1).hide(0);
		// $(this).children("div.sort-detail").hide(10);
	});

	//幻灯片左右控制器
	$("#mycarousel").hover(function(){
		$(this).children(".carousel-control").show();
	},function(){
		$(this).children(".carousel-control").hide();
	});

	//收藏按钮
	$(".data-item-li").hover(function(){
		//需处理显示哪个按钮
		// $(this).find(".like-button").css("display","inline-block");
		$(this).find(".like-button").show();
	},function(){
		$(this).find(".like-button").hide();
	});
	
	$(".info-a").hover(function(){
		//需处理显示哪个按钮
		// $(this).find(".like-button").css("display","inline-block");
		$(this).find(".dropdown-menu").show();
	},function(){
		$(this).find(".dropdown-menu").hide();
	});

	$('.like-button').click(function(){
		//$(this).removeClass("glyphicon-heart-empty");
        var goodsId = $(this).attr('data-id');
        if(!$(this).hasClass('glyphicon-heart')) {
            //收藏
            $.ajax({
                url:"/shop/collect",
                type:"POST",
                data:{
                    goodsid:goodsId
                },
                success:function () {
                    //收藏成功
                },
                error:function () {
                    alert("收藏失败");
                }
            })
        } else {
            //取消收藏
            $.ajax({
                url:"/shop/deleteCollect",
                type:"POST",
                data:{
                    goodsid:goodsId
                },
                success:function () {
                    //取消收藏成功
                },
                error:function () {
                    alert("取消收藏失败");
                }
            })
        }

		$.post("servlet/CollectServlet", { 
			goodsId: goodsId,
			});
		// alert("商品已加入购物车！");

        $(this).toggleClass("glyphicon-heart glyphicon-heart-empty");
	});
});