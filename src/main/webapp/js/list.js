$(document).ready(function (){
   $("[name='deleteList']").click(function (){
       var orderid=$(this).parents("[name='parent']").find("[name='orderid']").text();
       var order={};
       order.orderid= parseInt(orderid);
       $.ajax({
           type:"POST",
           url:"/shop/deleteList",
           contentType:"application/x-www-form-urlencoded; charset=utf-8",
           data:order,
           dataType:"json",
           success:function (result){
               location.reload();
           },
           error:function (){
               alert("删除失败");
           }
       });
   });
});