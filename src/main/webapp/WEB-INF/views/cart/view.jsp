<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2>Giỏ hàng</h2>
<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>Tên sản phẩm</th>
			<th>Size</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Số lượng</th>
			<th>Thành tiền</th>
			<th>Thao tác</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
	<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}">
		<tr data-id="${p.id}" data-price="${p.product.unitPrice}" data-discount="${p.product.discount}">
			<td>${p.id}</td>
			<td>${p.product.productName}</td>
			<td>${p.size}</td>
			<td><f:formatNumber value="${p.product.unitPrice}" pattern="#,### đ"/></td>
			<td><f:formatNumber value="${p.product.discount}" type="percent"/></td>
			<td><input value="${p.quantity}" type="number" min="1" style="width:70px"></td>
			<td class="total">
				<f:formatNumber value="${p.quantity * p.product.unitPrice * (1-p.product.discount)}" pattern="#,### đ"/>
			</td>
			<td>
				<button class="btn btn-sm btn-danger btn-cart-remove">
					<i class="glyphicon glyphicon-trash"></i>
				</button>
			</td>
		</tr>
	</c:forEach>	
	</tbody>
</table>
<button class="btn btn-md btn-warning btn-cart-clear">Dọn sạch</button>
<button class="btn btn-md btn-info" onclick="window.location.href='/'">Tiếp tục mua sắm</button>
<c:if test="${cart.count > 0}">
<a href="/order/checkout" class="btn btn-md btn-success btn-cart-checkout">Thanh toán</a>
</c:if>