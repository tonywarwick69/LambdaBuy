<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Bảng hiển thị dữ liệu</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>Tên đăng nhập</th>
								<th>Họ tên</th>
								<th>SDT</th>
								<th>Email</th>
								<th>Kích hoạt</th>
								<th>Quyền</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr class="odd gradeX">
									<td>${e.id}</td>
									<td>${e.fullname}</td>
									<td>${e.telephone}</td>
									<td>${e.email}</td>
									<td>${e.activated?'Yes':'No'}</td>
									<td>${e.admin?'Admin':'User'}</td>
									<td><a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Edit</a> 
									<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>




