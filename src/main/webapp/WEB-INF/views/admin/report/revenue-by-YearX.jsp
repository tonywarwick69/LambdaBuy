<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<!-- /.row -->
<div class="row">	
	<div class="col-lg-12">
		<h1 class="page-header">Thống kê doanh thu bán hàng năm ${year} </h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<jsp:include page="_revenue_YearX_chart.jsp" />

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
								<th>Tháng</th>
								<th>Doanh thu</th>
								<th>Số lượng</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${data}">
								<tr>
									<td>${e[0]}</td>
									<td><f:formatNumber value="${e[1]}" pattern="#,###" /> VNĐ</td>
									<td>${e[2]}</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

 