<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container" style="margin-bottom: 25px">
	<br>


	<h3 class="title" style="font-weight: 700">Thông tin cá nhân</h3>
	<br>


	<div class="row">
		<div class="col-sm-4">
			<div class="quan-li-thong-tin">
				<li class="nav-item2 active" style="list-style-type: none;"><a
					class="nav-link collapsed" href="faq.html" ata-toggle="collapse"
					id="i">
						<div class="row">
							<div class="col-sm-2">
								<i class="fas fa-info-circle" style="font-size: 30px; padding: 12px 5px; color: black;"></i>
							</div>
							<div class="col-sm-10" style="padding: 0px 15px;">
								<span> <b>Thông tin cá nhân</b>
									<p>Quản lý thông tin cá nhân</p>
								</span>
							</div>
						</div>
				</a></li>
			</div>
			<li class="nav-item2" style="list-style-type: none;">
				<a class="nav-link collapsed" href="/account/change" data-toggle="collapse" data-target="#collapseNews" aria-expanded="true" aria-controls="collapseNews">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-key"
								style="font-size: 30px; padding: 12px 5px; color: rgb(255, 208, 0);"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Thay đổi mật khẩu</b>
								<p>Cập nhật mật khẩu mới</p>
							</span>
						</div>
					</div>
				</a>
			</li>
			<li class="nav-item2" style="list-style-type: none;"><a
				class="nav-link collapsed" href="/order/list"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-shopping-cart"
								style="font-size: 30px; padding: 12px 5px; color: brown;"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Lịch sử đơn hàng</b>
								<p>Thông tin sản phẩm đã mua</p>
							</span>
						</div>
					</div>
			</a>
		</li>

		</div>

		<div class="col-sm-8">
			<div class="ct1">
				<div>
					<h4 style="font-weight: 600">Thông tin cá nhân</h4>
					<hr>
					<form:form action="/account/edit" modelAttribute="form" enctype="multipart/form-data">
					<h4 class="label label-success">${message}</h4>
						<br>
						<div class="row">
							<div class="col-sm-4">
								<p>Ảnh:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<img src="/static/images/customers/${form.photo}"
										style="width: 80px; height: 90px;" /> <input type="file"
										name="photo_file" />
									<form:hidden path="photo" class="form-control" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Tên đăng nhập:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="id" class="form-control" readonly="true" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Họ tên:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="fullname" class="form-control" required="required" pattern=".{6,}" title="Họ tên phải từ 6 ký tự trở lên"/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Điện thoại:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="telephone" class="form-control" required="required" pattern=".{9,}" title="Số điện thoại gồm 10 số "/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Email:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="email" class="form-control" required="required" readonly="true"/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Ngày sinh:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<form:input style="width: 90%;" path="birthDay" class="form-control" required="required"
						title="dd/MM/yyyy" placeholder="dd/MM/yyyy" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-8">
								<form:hidden path="password" />
								<form:hidden path="activated" />
								<form:hidden path="role" />
								<button class="btn btn-success" style="width: 90%;">Cập nhật</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
.dang-nhap {
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}

.quan-li-thong-tin .active {
	background-color: white;
	width: 110%;
	padding: 10px 5px 0px;
	border-radius: 5px;
}

.gach {
	background-color: blue;
	width: 100px;
}

.quan-li-thong-tin .active span {
	color: black;
}
</style>