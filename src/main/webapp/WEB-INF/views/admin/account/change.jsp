<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Thay đổi mật khẩu</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<h4 class="label label-success">${message}${param.message}</h4>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form:form action="/admin/change" modelAttribute="form" method="post" enctype="multipart/form-data">
							<br>
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
									<p>Mật khẩu hiện tại:</p>
								</div>
								<div class="col-sm-8">
									<p>
										<input name="pw" type="password" class="form-control"
											style="width: 90%;" />
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<p>Mật khẩu mới:</p>
								</div>
								<div class="col-sm-8">
									<p>
										<input name="pw1" type="password" class="form-control"
											style="width: 90%;" />
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<p>Xác nhận mật khẩu mới:</p>
								</div>
								<div class="col-sm-8">
									<p>
										<input name="pw2" type="password" class="form-control"
											style="width: 90%;" />
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="col-sm-8">
									<button class="btn btn-success" style="width: 90%;">Cập
										nhật</button>
								</div>
							</div>
						</form:form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>