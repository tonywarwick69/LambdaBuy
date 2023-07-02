<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>


<div class="row">	
	<div class="col-lg-12">
		<h1 class="page-header">Thống kê doanh thu bán sản phẩm</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
		<div class="col-lg-4">
			<h3>Chọn nhà cung cấp để thống kê:</h3>
			<select id="mySelect" onClick="changeText()">
				<option disabled selected value> -- select an option -- </option>
				<c:forEach var="p" items="${suppliers}">
					<option value="${p.id}">${p.name}</option>
				</c:forEach>
			</select>
			<a id="thongke" class="btn btn-primary" role="button" href="#"  target="_blank">THỐNG KÊ</a>
		</div>
		<div class="col-lg-4">
			<h3>Chọn thương hiệu để thống kê:</h3>
			<select id="mySelectBrand" onClick="changeTextBrand()">
				<option disabled selected value> -- select an option -- </option>
				<c:forEach var="b" items="${brands}">
					<option value="${b.id}">${b.name}</option>
				</c:forEach>
			</select>
			<a id="thongkeBrand" class="btn btn-primary" role="button" href="#"  target="_blank">THỐNG KÊ</a>
		</div>
		<div class="col-lg-4">
			<h3>Chọn danh mục để thống kê:</h3>
			<select id="mySelectCategory" onClick="changeTextCategory()">
				<option disabled selected value> -- select an option -- </option>
				<c:forEach var="c" items="${cates}">
					<option value="${c.id}">${c.name}</option>
				</c:forEach>
			</select>
			<a id="thongkeCategory" class="btn btn-primary" role="button" href="#"  target="_blank">THỐNG KÊ</a>
		</div>
		<div class="col-lg-8">
			<h3>Chọn danh khách hàng để thống kê:</h3>
			<select id="mySelectCustomer" onClick="changeTextCustomer()">
				<option disabled selected value> -- select an option -- </option>
				<c:forEach var="u" items="${users}">
					<c:choose>
						<c:when test="${u.role ==3 || u.role ==2}">
							<option value="${u.id}">${u.fullname}</option>
						</c:when>
					</c:choose>
				</c:forEach>
			</select>
			<a id="thongkeCustomer" class="btn btn-primary" role="button" href="#"  target="_blank">THỐNG KÊ</a>
		</div>
</div>
<!-- /.row -->
<div class="row">	
	<div class="col-lg-12">
		<h3 class="page-header">Thống kê doanh thu bán sản phẩm theo danh mục</h3>
	</div>
	<!-- /.col-lg-12 -->
</div>
<jsp:include page="_revenue_chart.jsp" />

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
								<th>Loại</th>
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
<script>
	function changeText(){
		$('#mySelect').change(function(){
			var id = $("#mySelect :selected").attr('value');
			console.log(id);
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongke');
			document.getElementById("thongke").href="revenueBySupplierId/"+id; 
			//btn.textContent =  name;
		})
	}
	
	function changeTextBrand(){
		$('#mySelectBrand').change(function(){
			var id = $("#mySelectBrand :selected").attr('value');
			console.log(id);
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongkeBrand');
			document.getElementById("thongkeBrand").href="revenueByBrandId/"+id; 
			//btn.textContent =  name;
		})
	}
	
	function changeTextCategory(){
		$('#mySelectCategory').change(function(){
			var id = $("#mySelectCategory :selected").attr('value');
			console.log(id);
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongkeCategory');
			document.getElementById("thongkeCategory").href="revenueByCategoryId/"+id; 
			//btn.textContent =  name;
		})
	}
	
	function changeTextCustomer(){
		$('#mySelectCustomer').change(function(){
			var id = $("#mySelectCustomer :selected").attr('value');
			console.log(id);
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongkeCustomer');
			document.getElementById("thongkeCustomer").href="revenueByCustomerId/"+id; 
			//btn.textContent =  name;
		})
	}
</script>
 