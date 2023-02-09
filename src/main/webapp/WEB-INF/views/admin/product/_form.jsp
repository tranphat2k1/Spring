<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="form-group">
				<form:hidden path="id" class="form-control"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Nhãn hiệu</label>
				<form:select path="brand.id" class="form-control">
					<form:options items="${brands}" itemLabel="brandName" itemValue="id"></form:options>
				</form:select>
			</div>
			<div class="form-group col-sm-6">
				<label>Tên sản phẩm</label>
				<form:input path="productName" class="form-control"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Giá</label>
				<form:input path="unitPrice" class="form-control"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Giảm giá</label>
				<form:input path="discount" class="form-control"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Hình ảnh</label>
				<input type="file" name="image_file">
				<form:hidden path="image" class="form-control"/>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Mô tả</label>
					<form:textarea path="description" rows="5" class="form-control"/>
				</div>
				<div class="form-group">
					<form:hidden path="brand.id" class="form-control"/>
				</div>
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