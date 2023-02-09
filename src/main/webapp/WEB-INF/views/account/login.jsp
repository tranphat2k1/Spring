<%@ page pageEncoding="utf-8"%>

<div class="panel panel-default">
	<div class="panel-body">
		<h2>Đăng nhập</h2>
		<h4 class="label label-success">${success}</h4>
		<h4 class="label label-danger">${error}</h4>
		<form action="/account/login" method='POST'>
			<div class="form-group">
				<label>Email</label>
				<input type="text" name="email" class="form-control">
			</div>
			<div class="form-group">
				<label>Mật khẩu</label>
				<input type="password" name="psw" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-success">Đăng nhập</button>
			</div>
			<div class="form-group">
				<p>Bạn chưa có tài khoản?</p>
				<a href="/account/register">Đăng ký ngay</a>
			</div>
		</form>
	</div>
</div>