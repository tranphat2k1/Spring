$(document).ready(function(){
	$("tr[data-id] input").on("input", function(){
		var id = $(this).closest("tr").attr("data-id");
		var price = $(this).closest("tr").attr("data-price");
		var discount = $(this).closest("tr").attr("data-discount");
		var qty = $(this).val()
		$.ajax({
			url:"/cart/update/"+id+"/"+qty,
			success:function(response){
				$("#cart-count").html(response[0])
				$("#cart-total").html(response[1])
			}
		})
		var total = qty * price * (1-discount)
		$(this).closest("tr").find("td.total").html(total)
	})
	
	$(".btn-cart-remove").click(function(){
		var id = $(this).closest("tr").attr("data-id");
		$.ajax({
			url:"/cart/remove/"+id,
			success:function(response){
				$("#cart-count").html(response[0])
				$("#cart-total").html(response[1])
			}
		})
		$(this).closest("tr").remove()
	})
	
	$(".btn-cart-clear").click(function(){
		$.ajax({
			url:"/cart/clear",
			success:function(){
				$("#cart-count").html(0)
				$("#cart-total").html(0)
				$("table>tbody").html("")
				$(".btn-cart-checkout").remove()
			}
		})
	})
	
	$(".btn-add-to-cart").click(function(){
		var id = $(this).closest("div").attr("data-id");
		var size = $(".size:checked").val();
		alert("Thêm vào giỏ hàng thành công\n ^.^!")
		$.ajax({
			url:"/cart/add/"+id+"/"+size,
			success:function(response){
				$("#cart-count").html(response[0])
				$("#cart-total").html(response[1])
			}
		})
	});
})