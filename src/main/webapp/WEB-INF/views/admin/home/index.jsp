<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Trang quản trị</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-car fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">${product.size()}</div>
						<div>Sản phẩm</div>
					</div>
				</div>
			</div>
			<a href="/admin/product/index">
				<div class="panel-footer">
					<span class="pull-left">Thêm nhanh</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-green">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-shopping-cart fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">${order.size()}</div>
						<div>Đơn hàng</div>
					</div>
				</div>
			</div>
			<a href="/admin/order/index">
				<div class="panel-footer">
					<span class="pull-left">Xem</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-yellow">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-user fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">${user.size()}</div>
						<div>Tài khoản</div>
					</div>
				</div>
			</div>
			<a href="/admin/customer/index">
				<div class="panel-footer">
					<span class="pull-left">Thêm nhanh</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
<!-- 	<div class="col-lg-3 col-md-6">
		<div class="panel panel-red">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-thumbs-o-up fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">13</div>
						<div>Phản hồi</div>
					</div>
				</div>
			</div>
			<a href="#">
				<div class="panel-footer">
					<span class="pull-left">Xem</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div> -->
</div>
<!-- /.row -->
<hr />
<img class="img-thumbnail"
	src="http://localhost:8080/ProjectJavaWebSpringHibernate/themes/img/slider_1.jpg"
	alt="">
