<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nhãn hiệu</th>
			<th>Tên sản phẩm</th>
			<th>Size</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Số lượng</th>
			<th>Thao tác</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.product.brand.brandName}</td>
			<td>${e.product.productName}</td>
			<td>${e.size}</td>
			<td><f:formatNumber value="${e.product.unitPrice}" pattern="#,### đ"/></td>
			<td><f:formatNumber value="${e.product.discount}" type="percent"/></td>
			<td>${e.quantity}</td>
			<td>
				<a class="btn btn-sm btn-primary" href="${base}/edit/${e.id}">Sửa</a>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>