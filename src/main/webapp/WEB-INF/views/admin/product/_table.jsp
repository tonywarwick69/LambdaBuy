<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

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
								<th>ID</th>
								<th>Tên sản phẩm</th>
								<th>Loại sản phẩm</th>
								<th>Thương hiệu</th>
								<th>Nhà cung cấp</th>
								<th>Đơn giá</th>
								<th>Giảm giá</th>
								<th>Số lượng</th>
								<th>Lượt xem</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr class="odd gradeX">
									<td>${e.id}</td>
									<td>${e.name}</td>
									<td>${e.category.name}</td>
									<td>${e.brand.name}</td>
									<td>${e.supplier.name}</td>
									<td>
										<f:formatNumber value="${e.unitPrice}" pattern="#,###" /> VNĐ
									</td>
									<td>${e.discount}</td>
									<td>${e.quantity}</td>
									<td>${e.viewCount}</td>
									
									<td>
										<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Edit</a>
										<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}" >Delete</a>
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