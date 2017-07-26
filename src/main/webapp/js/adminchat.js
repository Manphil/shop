/**
 * Created by 文辉 on 2017/7/26.
 */
var client;
var clientID;
$(window).on('beforeunload',function(){
    client=null;
    window.opener.document.getElementById("flag").value="0";
});
$(document).ready(function() {
    clientID=$('#sendId').text();
    client = new Messaging.Client('127.0.0.1',61614,clientID);
    client.onConnectionLost = function(){
        alert("连接已断开");
    };
    //收到消息
    client.onMessageArrived = function(message){
        var msgObj=jQuery.parseJSON(message.payloadString);
        // $('#toID').val(msgObj.from);
        // debugger
        if (msgObj.to===clientID){
            // debugger;
            var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + msgObj.body + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);
            /*$('#message').append("<font color=red>"+msgObj.from+":"+msgObj.body+"</font></br>");*/
        }
    };
    //建立连接和订阅
    client.connect({onSuccess:function(){
        //订阅topic
        client.subscribe("topic");
        // alert("连接成功");
    }});
    //var loadMessage = setInterval(receive,1000);
    //var loadList = setInterval(refreshList,1000);
    //receive();
    // refreshList();
    //点击发送按钮
    $("#send-message").click(function() {

        var message = $("#input-message").val();
        if (message !== '') {

            clientID=$('#sendId').text();
            var msg={};
            msg.from=clientID;
            msg.to=$('#receiveId').text();
            msg.body=message;
            message = new Messaging.Message(JSON.stringify(msg));
            message.destinationName = "topic";
            client.send(message);

            $("#input-message").val('');
            var element = '<div class="chat-message2 chat-message"> <div class="chat-message-content2  animated slideInRight"><div class="info-content"> ' + msg.body + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);


            //始终保持滚动条滚动到最下方
            $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

            $.ajax({
                url: "/shop/sendMessage/", //把表单数据发送到ajax.jsp
                type: "POST",
                data: {
                    senduser: clientID,
                    receiveuser: msg.to,
                    msgcontent: msg.body
                },
                error: function(request) {
                    alert("保存消息失败");
                },
                success: function(data) {
                    // alert("success!"); //将返回的结果显示到ajaxDiv中
                }
            });

        }
    });

    //回车
    $(document).keypress(function(e) {
        if (e.which == 13) {
            e.preventDefault();
            jQuery("#send-message").click();
        }
    });

    $('.a-card').click(function() {
        $('.a-card').css("background","#FFFFFF")
        $(this).css("background","#F8F8F8");
        var userid = $(this).attr("data-userid");
        var username = $(this).children(".card").text();
        $("#receive").text(username);
        $("#receiveId").text(userid);

        //发异步请求查聊天消息
        $.ajax({
            url: "/shop/getMessage/", //把表单数据发送到ajax.jsp
            type: "POST",
            data: {
                senduser: $("#sendId").text(),
                receiveuser: userid,
            },
            error: function(request) {
                alert("保存消息失败");
            },
            success: function(result) {
                $('.chat-content-body').empty();
                showMessage(result.info.message);
                // alert("success!"); //将返回的结果显示到ajaxDiv中
            }
        });
    });

    $('.chat-list').hover(function() {
        $(this).css("overflow-y","auto");
    }, function() {
        $(this).css("overflow-y","hidden");
    });

});


function showMessage(message) {
    // $("#input-message").val('');
    var receiveId = $('#receiveId').text();

    $.each(message, function (index,item) {
        if (item.senduser == receiveId) {
            var element = '<div class="chat-message1 chat-message"> <div class="chat-message-content1"><div class="info-content"> ' + item.msgcontent + '</div> </div> </div>';
            var element_float = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element, element_float);
        } else {
            var element1 = '<div class="chat-message2 chat-message"> <div class="chat-message-content2"><div class="info-content"> ' + item.msgcontent + '</div> </div> </div>';
            var element_float1 = '<div class="clear-float"></div>';
            $(".chat-content-body").append(element1, element_float1);
        }
    });

    //始终保持滚动条滚动到最下方
    $(".chat-content").scrollTop($(".chat-content")[0].scrollHeight);

}

