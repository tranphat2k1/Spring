<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="row">
	<div class="col-sm-7 text-center">
		<img class="pro_detail" src="/static/images/products/${pro.image}">
	</div>
	<div class="col-sm-5">
		<ul class="info_detail">
			<li>Tên sản phẩm: ${pro.productName}</li>
			<li>Nhãn hiệu: ${pro.brand.brandName}</li>
			<li>Giảm giá: <f:formatNumber value="${pro.discount}" type="percent"/></li>
			<li>Giá:
			<c:choose>
				<c:when test="${pro.discount > 0}">
					<p class="inline" style="text-decoration:line-through;font-size:small"><f:formatNumber value="${pro.unitPrice}" pattern="#,### đ"/></p> 
					<p class="inline" style="color:orange;"><f:formatNumber value="${pro.unitPrice *(1- pro.discount)}" pattern="#,### đ"/></p>
				</c:when>
				<c:when test="${pro.discount == 0}">
					<p class="inline"><f:formatNumber value="${pro.unitPrice}" pattern="#,### đ"/></p>
				</c:when>
			</c:choose>
			</li>
			<li>Chọn size:
				 <form>
				    <label class="radio-inline">
				      <input class="size" type="radio" value="39" name="size" checked>39
				    </label>
				    <label class="radio-inline">
				      <input class="size" type="radio" value="40" name="size">40
				    </label>
				    <label class="radio-inline">
				      <input class="size" type="radio" value="41" name="size">41
				    </label>
				    <label class="radio-inline">
				      <input class="size" type="radio" value="42" name="size">42
				    </label>
				    <label class="radio-inline">
				      <input class="size" type="radio" value="43" name="size">43
				    </label>
				  </form>
			</li>
			<div data-id="${pro.id}">
				<button class="btn btn-success btn-add-to-cart" style="width: 100px"><i class="glyphicon glyphicon-shopping-cart"></i></button>
			</div>  
		</ul>
	</div>
</div>
<div class="text-justify">${pro.description}</div>

<h3>Sản phẩm cùng nhãn hiệu</h3>
<c:forEach var="p" items="${list}">
	<a href="/product/detail/${p.id}">
		<img class="thumb_img" src="/static/images/products/${p.image}">
	</a>
</c:forEach>
