<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>


<div class="row">	
	<div class="col-lg-12">
		<h1 class="page-header">Thống kê doanh theo thời gian</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
		<div class="col-lg-4">
			<h3>Thống kê doanh thu nhà bán hàng:</h3>
			<select id="supplierMonth">
				<option disabled selected value> -- Tháng -- </option>
				<c:forEach var = "i" begin = "1" end = "12">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<select id="supplierYear" >
				<option disabled selected value> -- Năm -- </option>
				<c:forEach var = "i" begin = "2010" end = "2022">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<a id="thongke" class="btn btn-primary" role="button" href="#"  target="_blank" onClick="changeText()">THỐNG KÊ</a>
		</div>
		<div class="col-lg-4">
			<h3>Thống kê doanh thu của tháng, năm:</h3>
			<select id="Month1">
				<option disabled selected value> -- Tháng -- </option>
				<c:forEach var = "i" begin = "1" end = "12">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<select id="Year1" >
				<option disabled selected value> -- Năm -- </option>
				<c:forEach var = "i" begin = "2010" end = "2022">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<a id="thongkeMY" class="btn btn-primary" role="button" href="#"  target="_blank" onClick="changeTextMY()">THỐNG KÊ</a>
		</div>
		<div class="col-lg-4">
			<h3>Thống kê doanh thu của năm:</h3>
			<select id="Year2" onClick="changeTextY()">
				<option disabled selected value> -- Năm -- </option>
				<c:forEach var = "i" begin = "2010" end = "2022">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<a id="thongkeY" class="btn btn-primary" role="button" href="#"  target="_blank" onClick="changeTextMY()">THỐNG KÊ</a>
		</div>
		<div class="col-lg-8">
			<h3>Thông kê doanh thu các năm:</h3>
			<a id="thongkeAll" class="btn btn-primary" role="button" href="year"  target="_blank">THỐNG KÊ</a>
		</div>
</div>
<!-- /.row -->

<script>
	function changeText(){
		
			var month= $("#supplierMonth :selected").attr('value');
			var year= $("#supplierYear :selected").attr('value');
			
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongke');
			document.getElementById("thongke").href="revenueBySupplierMY/"+month+"/"+year; 
			//btn.textContent =  name;
		
	}
	
	function changeTextMY(){
		
			var month= $("#Month1 :selected").attr('value');
			var year= $("#Year1 :selected").attr('value');
			
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongkeBrand');
			document.getElementById("thongkeMY").href="revenueByMonthYearX/"+month+"/"+year; 
			//btn.textContent =  name;
		
	}
	
	function changeTextY(){
		
			var year= $("#Year2 :selected").attr('value');
			
			
			//alert($("#mySelect :selected").attr('value'))
			const btn = document.getElementById('thongkeY');
			document.getElementById("thongkeY").href="revenueByYearX/"+year;  
			//btn.textContent =  name;
		
	}
	
</script>
 