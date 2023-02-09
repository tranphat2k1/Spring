<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:forEach var="p" items="${list}">
	<div class="col-sm-4">
		<div class="thumbnail">
			<a href="/product/detail/${p.id}"> 
			<img class="product" src="/static/images/products/${p.image}">
				<div class="caption">
					<p>${p.productName}</p>
					<c:choose>
						<c:when test="${p.discount > 0}">
							<p class="inline" style="text-decoration:line-through;font-size:small"><f:formatNumber value="${p.unitPrice}" pattern="#,### đ"/></p> 
							<p class="inline" style="color:orange;"><f:formatNumber value="${p.unitPrice *(1- p.discount)}" pattern="#,### đ"/></p>
						</c:when>
						<c:when test="${p.discount <= 0}">
							<p class="inline" ><f:formatNumber value="${p.unitPrice}" pattern="#,### đ"/></p>
							<p class="inline"></p>
						</c:when>
					</c:choose>
				</div>
			</a>
		</div>
	</div>
</c:forEach>