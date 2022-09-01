<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="container" style="margin-bottom: 25px">
	<br>

	<h3 class="title" style="font-weight: 700">Thay đổi mật khẩu</h3>
	<br>


	<div class="row">
		<div class="col-sm-4">

			<li class="nav-item2 " style="list-style-type: none;"><a
				class="nav-link collapsed" href="/account/edit"
				ata-toggle="collapse" id="i">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-info-circle"
								style="font-size: 30px; padding: 12px 5px; color: black;"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Thông tin cá nhân</b>
								<p>Quản lý thông tin cá nhân</p>
							</span>
						</div>
					</div>
			</a></li>

			<li class="nav-item2 " style="list-style-type: none;"><a
				class="nav-link collapsed" href="/account/change"
				data-toggle="collapse" data-target="#collapseNews"
				aria-expanded="true" aria-controls="collapseNews">
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
			</a></li>
			<div class="quan-li-thong-tin">
				<li class="nav-item2 active" style="list-style-type: none;"><a
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
				</a></li>
			</div>
		</div>

		<div class="col-sm-8">
			<div class="ct1">
				<div>
					<h4 style="font-weight: 600">Lịch sử đơn hàng</h4>
					<hr>
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th>Mã đơn hàng</th>
								<th>Ngày mua</th>
								<th>Địa chỉ</th>
								<th>Tổng tiền</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o" items="${orders}">
								<tr>
									<td>${o.id}</td>
									<td><fmt:formatDate type="both" dateStyle="short"
											timeStyle="short" value="${o.orderDate}" /></td>
									<td>${o.address }</td>
									<td><f:formatNumber value="${o.amount}" pattern="#,###" />
										VNĐ</td>
									<td><a href="/order/detail/${o.id}"
										class="btn btn-sm btn-warning"> Chi tiết </a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
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

h3.title {
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 1px solid #d5d5d5;
	position: relative
}

h3.title:after {
	content: '';
	display: block;
	width: 30px;
	height: 3px;
	background-color: #fbaf32;
	position: absolute;
	left: 0;
	bottom: -1px
}

.title-h h3 {
	font-weight: bolder;
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









