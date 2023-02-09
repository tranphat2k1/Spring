<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Tên sản phẩm</th>
			<th>Size</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Số lượng</th>
			<th>Thành tiền</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${details}">
		<tr>
			<td>${e.productDetail.id}</td>
			<td>${e.productDetail.product.productName}</td>
			<td>${e.productDetail.size}</td>
			<td><f:formatNumber value="${e.productDetail.product.unitPrice}" pattern="#,### đ"/></td>
			<td><f:formatNumber value="${e.productDetail.product.discount}" type="percent"/></td>
			<td>${e.quantity}</td>
			<td>
				<f:formatNumber value="${e.quantity * e.productDetail.product.unitPrice * (1- e.productDetail.product.discount)}" pattern="#,### đ"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>