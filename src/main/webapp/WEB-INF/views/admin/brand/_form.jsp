<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Tên nhãn hiệu</label>
				<form:input path="brandName" class="form-control"/>
			</div>
			<div class="form-group">
				<form:hidden path="id" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-success" formaction="${base}/create">Tạo</button>
				<button class="btn btn-info" formaction="${base}/update">Cập nhật</button>
				<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
				<a class="btn btn-warning" href="${base}">Reset</a>
				
			</div>
		</form:form>
	</div>
</div>