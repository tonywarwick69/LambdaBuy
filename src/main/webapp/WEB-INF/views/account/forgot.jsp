<%@ page pageEncoding="utf-8"%>

<br/>
<div class="container">
	<div class=dang-nhap>
		<h2>QUÊN MẬT KHẨU</h2>
		<h4 class="label label-success">${message}</h4>
		<form action="/account/forgot" method="post">
			<div class="form-group">
				<label>Tên tài khoản:</label> <input name="id" class="form-control" />
			</div>
			<div class="form-group">
				<label>Email:</label> <input name="email" class="form-control" />
			</div>
			<div class="form-group">
				<button class="btn btn-success">Gửi thông tin</button>
			</div>
		</form>
	</div>
</div>
<br/>
<br/>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>

