$(document).ready(function() {
	$("div.ct1[data-id] input").on("input", function(){
		var id = $(this).closest("div").attr("data-id");
		var price = $(this).closest("div").attr("data-price");
		var discount = $(this).closest("div").attr("data-discount");
		var qty = $(this).val();
		$.ajax({
			url:`/cart/update/${id}/${qty}`,
			success: function(response){
				$(".cart-cnt").html(response[0]);
				$(".cart-amt").html(response[1]);
				
			}
		});
		var amt = qty*price*(1-discount);
		$(this).closest("div").find("div#amt").html(amt +" VNĐ");
		
	});
	
	//remove cart
	$(".btn-cart-remove").click(function() {
		var id = $(this).closest("tr").attr("data-id");
		$.ajax({
			url:"/cart/remove/"+id,
			success: function(response){
				$(".cart-cnt").html(response[0]);
				$(".cart-amt").html(response[1]);
				
			}
		});
		$(this).closest("tr").remove();
		location.reload();
	});
	
	//cart clear
	$(".btn-cart-clear").click(function() {
		$.ajax({
			url:"/cart/clear",
			success: function(response){
				$(".cart-cnt").html(0);
				$(".cart-amt").html(0);
				$("table>tbody").html("");
				location.reload();
			}
		});
		location.reload();
	});
	
	//add Shopping cart
	$(".btn-add-to-cart").on("click", function() {
		var id = $(this).closest("div").attr("data-id");

		$.ajax({
			url:"/cart/add/"+id,
			success: function(response){
				$(".cart-cnt").html(response[0]);
				$(".cart-amt").html(response[1]);
				location.reload();
			}
		});
		
		var img = $(this).closest(".thumbnail").find("a>img");
		var options = {to:'#cart-img', className:'cart-fly'}
		var cart_css='.cart-fly{background-image: url("'+img.attr("src")+'");background-size: 100% 100%;}';
		$("style#cart-css").html(cart_css);
		img.effect('transfer', options, 500);
	
	});
	
	//email dialong
	$(".btn-open-dialog").click(function() {
		var id = $(this).closest("div").attr("data-id");
		$("#myModal #id").val(id);
	});
	
	//email send
	$(".btn-send").click(function() {
		var form={
		 id: $("#myModal #id").val(),
		 to: $("#myModal #sender").val(),
		 body: $("#myModal #comments").val(),
		 from: $("#myModal #email").val()
		}
		$.ajax({
			url:"/product/send-to-friend",
			data:form,
			type:'post',
			success: function(response){
				if(response){
					$("[data-dismiss]").click();
					alert("Da gui thanh cong")
				}
				else{
					alert("Loi gui mail")
			}
			}
		})
	});
	
	//button like
	$(".btn-star").click(function() {
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			url:"/product/add-to-favo/"+id,

			success: function(response){

					 alert("Bạn đã thích sản phẩm thành công!");

			}
		})
	});
});