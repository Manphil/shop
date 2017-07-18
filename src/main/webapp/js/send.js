$(document).ready(function() {

	//var loadMessage = setInterval(receive,1000);
	//var loadList = setInterval(refreshList,1000);
	//receive();
	refreshList();
	//点击发送按钮
	$("#send-message").click(function() {
		var message = $("#input-message").val();
		if (message !== '') {
			$("#input-message").val('');
			var element = '<div class="chat-message2 chat-message"> <div class="chat-message-content2  animated slideInRight"><div class="info-content"> ' + message + '</div> </div> </div>';
			var element_float = '<div class="clear-float"></div>';
			$(".chat-content-body").append(element, element_float);


			//始终保持滚动条滚动到最下方
			$(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

			/*$.ajax({
				cache: false,
				type: "POST",
				url: "chat.jsp", //把表单数据发送到ajax.jsp
				data: "message=aaa", //要发送的是ajaxFrm表单中的数据
				async: false,
				error: function(request) {
					alert("发送请求失败！");
				},
				success: function(data) {
					alert("success!"); //将返回的结果显示到ajaxDiv中
				}
			});*/
			var receive = $("#receiveId").text();
			$.post("servlet/ChatServlet", { 
				message: message,
				time: new Date(),
				receiveId: receive
			});
			receive();
			refreshList();
			/*$.get("servlet/ChatServlet", { 
				message: message,
				time: new Date(),
				receiveId: receive
				},
				function(data,status){
					alert("数据: \n" + data + "\n状态: " + status);
				});*/
		}
	});

	//回车
	$(document).keypress(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			jQuery("#send-message").click();
		}
	});

	$('.list-item').click(function() {
		$('.list-item').css("background","#FAFAFA");
		$(this).css("background","#EBEBEC");
		var name = $(this).children("#user-name").text();
		var number = $(this).children("#user-no").text();
		$("#receive").text(name);
		$("#receiveId").text(number);
		receive();
		refreshList();
	});
	/*function hitList(){
		$('.list-item').css("background","#FAFAFA");
		$(this).css("background","#EBEBEC");
		var name = $(this).children("#user-name").text();
		var number = $(this).children("#user-no").text();
		$("#receive").text(name);
		$("#receiveId").text(number);

	}*/

	$('.chat-list').hover(function() {
		$(this).css("overflow-y","auto");
	}, function() {
		$(this).css("overflow-y","hidden");
	});
	//refreshList();
	
	$('body').mouseenter(function(){
		if($("#receive").text() != ''){
			receive();
		}
		refreshList();
	});
	$('body').click(function(){
		if($("#receive").text() != ''){
			receive();
		}
		refreshList();
	});
});

function receive(){
	var sendUser = $('#receiveId').text();
	$.post("servlet/ReceiveServlet", {
		sendId: sendUser,
	},
	function(data, status){
		//alert(JSON.stringify(data));
		// alert(typeof(data));
		//var arr = eval(data);
		//console.log(data.MsgContent);
		//alert(data);
		$(".chat-content-body").html('');
		for (var i = 0; i < data.length; i++) {
			showMessage(data[i].User1,data[i].MsgContent);
		}
	},"json");
}

function showMessage(receiveName, message) {
	// $("#input-message").val('');
	var receiveId = $('#receiveId').text();
	if (receiveName == receiveId) {
		var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + message + '</div> </div> </div>';
		var element_float = '<div class="clear-float"></div>';
		$(".chat-content-body").append(element, element_float);
	} else {
		var element1 = '<div class="chat-message2 chat-message"> <div class="chat-message-content2"><div class="info-content"> ' + message + '</div> </div> </div>';
		var element_float1 = '<div class="clear-float"></div>';
		$(".chat-content-body").append(element1, element_float1);
	}
	//始终保持滚动条滚动到最下方
	$(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}

function refreshList() {
	$.post("servlet/RefreshServlet",
	function(data, status){
		//alert(JSON.stringify(data));
		// alert(typeof(data));
		//var arr = eval(data);
		//console.log(data.MsgContent);
		//alert(data);
		//$(".chat-list").html('');
		for (var i = 0; i < data.length; i++) {
			// showList(data[i].UserId,data[i].Name);
			$('#list-item'+i).children("#user-name").text(data[i].Name);
			$('#list-item'+i).children("#user-no").text(data[i].UserId);
			$('#list-item'+i).css("display","block");
		}
	},"json");
}

function showList(id,name) {
	var item = '<div class="list-item"><h3 id="user-name">'+name+'</h3><span id="user-no">'+id+'</span></div>';
	$('.chat-list').append(item);
}