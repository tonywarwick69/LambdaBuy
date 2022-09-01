<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>




<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Doanh thu theo khách hàng</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<jsp:include page="_revenue_customer_chart.jsp"/>

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
								<th>Khách hàng</th>
								<th>Số lượng</th>
								<th>Doanh thu</th>
								<th>Thấp nhất</th>
								<th>Cao nhất</th>
								<th>Trung bình</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${data}">
								<tr>
									<td>${e[0]}</td>
									<td>${e[1]}</td>
									<td><f:formatNumber value="${e[2]}" pattern="#,###" /> VNĐ</td>
									<td><f:formatNumber value="${e[3]}" pattern="#,###" /> VNĐ</td>
									<td><f:formatNumber value="${e[4]}" pattern="#,###" /> VNĐ</td>
									<td><f:formatNumber value="${e[5]}" pattern="#,###" /> VNĐ</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>




