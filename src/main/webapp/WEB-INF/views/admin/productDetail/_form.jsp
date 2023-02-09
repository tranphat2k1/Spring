<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="form-group">
				<form:hidden path="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Tên sản phẩm</label>
				<form:select path="product.id" class="form-control">
					<form:options items="${products}" itemLabel="productName" itemValue="id"></form:options>
				</form:select>
			</div>
			<div class="form-group">
				<label>Size</label>
				<div>
					<form:radiobutton path="size" value="39" label="39"/>
					<form:radiobutton path="size" value="40" label="40"/>
					<form:radiobutton path="size" value="41" label="41"/>
					<form:radiobutton path="size" value="42" label="42"/>
					<form:radiobutton path="size" value="43" label="43"/>
				</div>
			</div>
			<div class="form-group">
				<label>Số lượng</label>
				<form:input path="quantity" class="form-control"/>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<button class="btn btn-success" formaction="${base}/create">Tạo</button>
					<button class="btn btn-info" formaction="${base}/update">Cập nhật</button>
					<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
					<a class="btn btn-warning" href="${base}">Reset</a>
				</div>
			</div>
		</form:form>
	</div>
</div>