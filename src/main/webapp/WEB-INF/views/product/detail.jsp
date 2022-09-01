<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />
<br />
<div class="row">
	<div class="col-sm-9">
		<div class="ct1">
			<!-- SHOP PRODUCTS -->
			<div class="row">
				<div class="col-sm-5">

					<div class="product-image">
						<img src="/static/images/products/${prod.image}"
							title="${prod.name}">
					</div>
				</div>
				<div class="col-sm-7">
					<div class="san-pham-ct">
						<h3 style="color: black; font-weight: bold; text-align: left;">
							${prod.name}</h3>
						<p>
							Thương hiệu: <b>${prod.category.nameVN}</b> | SKU: ${prod.id}
						</p>
						<br /> <a href="/product/detail/${prod.id}"> <c:choose>
								<c:when test="${prod.discount > 0 }">
									<p
										style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px; margin-right: 110px">
										<span
											style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
											-<f:formatNumber value="${prod.discount}" type="percent" />
										</span>
									</p>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>


						</a>
						<p style="padding: 3px; font-size: 20px; font-weight: bold;">
							<c:choose>
								<c:when test="${prod.discount <= 0 }">
									<span
										style="text-align: left; font-weight: bold; color: red"><f:formatNumber
											value="${prod.unitPrice}" pattern="#,###" />VNĐ </span>
								</c:when>
								<c:otherwise>
									<span
										style="text-decoration: line-through; color: Gray; font-weight: bold;">
										<f:formatNumber value="${prod.unitPrice}" pattern="#,###" />
										VNĐ
									</span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${prod.discount > 0 }">
									<span style="margin-left: 5px; font-weight: bold; color: red">
										<f:formatNumber
											value="${prod.unitPrice * (1 - prod.discount)}"
											pattern="#,###" /> VNĐ
									</span>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</p>
						<p>
							Tình trạng: <span
								style="background-color: #99FF99; border-radius: 4px; padding: 3px; color: black; font-weight: bold;">${prod.available?'Còn hàng':'Hết hàng'}</span>
						</p>

						<div class="row">
							<div class="col-sm-6" data-id="${prod.id}">
								<button class="theo-vao-gio btn-add-to-carts"
									data-toggle="modal" data-target="#myModals">THÊM VÀO
									GIỎ</button>
							</div>

						</div>

					</div>
					<br>
					<div class="sp-km">
						<h6>Khuyến mãi liên quan</h6>
						<p>
							<img style="margin-top: -5px"
								src="/static/images/icon/icon_km.png" width="15px" height="15px">
							<span>Trả góp 0% + 0đ qua thẻ tín dụng</span>
						</p>
						<p>
							<img style="margin-top: -5px"
								src="/static/images/icon/icon_km.png" width="15px" height="15px">
							<span>Bánh xe dự trữ, nón bảo hiểm, giá đỡ điện thoại và nhiều phụ kiện khác giảm 30% khi mua kèm</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="sp-km">
			<p>${prod.description}</p>

		</div>
	</div>

	<!-- /SHOP PRODUCTS -->

	<div class="col-sm-3">
		<div class="ct2">
			<!-- SHOP SIDEBAR -->
			<b style="font-size: 15px; color: green;"><i class="fas fa-truck"></i>&nbsp;&nbsp;&nbsp;Sản
				phẩm được miễn phí giao hàng</b>
			<div class="sp-km">
				<h6>Chính sách bán hàng</h6>
				<i><i class="	far fa-check-circle ico"></i> &nbsp;Cam kết xe
					chính hãng và đầy đủ giấy tờ pháp lý</i><br> <i><i class="fas fa-truck-monster ico"></i>
					&nbsp;Miễn phí giao hàng khắp Việt Nam</i><br> <i><i
					class="fas fa-redo ico"></i> &nbsp;Đổi trả miễn phí trong 10 ngày nếu phát sinh lỗi do nhà sản xuất</i> <br>
				<br>
				<h6>Dịch vụ khác</h6>
				<i><i class="fas fa-hammer ico"></i> &nbsp;Gửi bảo hành miễn phí xe mua ở WindMotors nếu phát sinh lỗi</i><br> 
				<i><i class="fa fa-car ico" aria-hidden="true"></i> &nbsp;Thu cũ đổi mới </i><br>
			</div>
			<!-- /SHOP SIDEBAR -->
		</div>
	</div>

</div>
</div>

<!-- /content -->
<br>


<!-- SP tương tự -->
<div class="container-fluid" style="padding: 0px 80px 0px 80px">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#tab1">SẢN PHẨM
				CÙNG LOẠI</a></li>
		<li><a data-toggle="tab" href="#tab2">SẢN PHẨM YÊU THÍCH</a></li>
		<li><a data-toggle="tab" href="#tab3">SẢN PHẨM ĐÃ XEM</a></li>
	</ul>

	<div class="tab-content">
		<div id="tab1" class="tab-pane fade in active">
			<div>
				<c:forEach var="p" items="${list}" begin="0" end="7">
					<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
						<div class="thumbnail">

							<a href="/product/detail/${p.id}"> <c:choose>
									<c:when test="${p.discount > 0 }">
										<p
											style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
											<span
												style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
												-<f:formatNumber value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose> <img style="margin-right: 30px; margin-top: 5px"
								class="estore-prod" src="/static/images/products/${p.image}"
								title="${p.name}">
							</a>

							<div class="caption">
								<p style="padding: 3px; text-align: center; color: black">
									<b>${p.name}</b>
								</p>
								<p
									style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold; color:red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold; color:red"> <f:formatNumber
													value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" />
												VNĐ
											</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</p>
								<br /> <br />
								<div data-id="${p.id}" class="pull-center text-center">
									<button class="btn btn-sm btn-danger btn-add-to-cart">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="glyphicon glyphicon-star"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-envelope"></i>
									</button>
								</div>
							</div>


						</div>
					</div>

				</c:forEach>


				<jsp:include page="dialog.jsp" />
			</div>
		</div>
		<div id="tab2" class="tab-pane fade">
			<div>
				<c:forEach var="p" items="${favo}" begin="0" end="7">
					<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
						<div class="thumbnail">

							<a href="/product/detail/${p.id}"> <c:choose>
									<c:when test="${p.discount > 0 }">
										<p
											style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
											<span
												style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
												-<f:formatNumber value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose> <img style="margin-right: 30px; margin-top: 5px"
								class="estore-prod" src="/static/images/products/${p.image}"
								title="${p.name}">
							</a>

							<div class="caption">
								<p style="padding: 3px; text-align: center; color: black">
									<b>${p.name}</b>
								</p>
								<p
									style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold; color: red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold; color: red"> <f:formatNumber
													value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" />
												VNĐ
											</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</p>
								<br /> <br />
								<div data-id="${p.id}" class="pull-center text-center">
									<button class="btn btn-sm btn-danger btn-add-to-cart">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="glyphicon glyphicon-star"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-envelope"></i>
									</button>
								</div>
							</div>


						</div>
					</div>

				</c:forEach>


				<jsp:include page="dialog.jsp" />
			</div>
		</div>
		<div id="tab3" class="tab-pane fade">
			<div>
				<c:forEach var="p" items="${viewed}" begin="0" end="7">
					<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
						<div class="thumbnail">

							<a href="/product/detail/${p.id}"> <c:choose>
									<c:when test="${p.discount > 0 }">
										<p
											style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
											<span
												style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
												-<f:formatNumber value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose> <img style="margin-right: 30px; margin-top: 5px"
								class="estore-prod" src="/static/images/products/${p.image}"
								title="${p.name}">
							</a>

							<div class="caption">
								<p style="padding: 3px; text-align: center; color: black">
									<b>${p.name}</b>
								</p>
								<p
									style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold; color: red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold; color: red"> <f:formatNumber
													value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" />
												VNĐ
											</span>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</p>
								<br /> <br />
								<div data-id="${p.id}" class="pull-center text-center">
									<button class="btn btn-sm btn-danger btn-add-to-cart">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="glyphicon glyphicon-star"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="glyphicon glyphicon-envelope"></i>
									</button>
								</div>
							</div>


						</div>
					</div>

				</c:forEach>

			</div>
		</div>

</div>
	<br />

		<jsp:include page="dialog.jsp" />
	</div>
</div>

<br />
<jsp:include page="dialog_cart.jsp" />
<style>
.thumbnail:hover {
	-webkit-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	-moz-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
}

.pull-center {
	margin-top: -30px;
}

.caption {
	height: 150px
}

.mua-ngay {
	border-radius: 5px;
	padding: 5px 10px;
	text-align: center;
	background-color: rgb(20, 53, 195);
	border: none;
	color: #fff;
	font-weight: 800;
	width: 100%;
	font-size: 18px;
}

.theo-vao-gio {
	border-radius: 5px;
	padding: 5px;
	text-align: center;
	background-image: linear-gradient(-90deg, rgb(240, 232, 8),
		rgb(248, 32, 32));
	border: none;
	color: #fff;
	font-weight: 800;
	width: 100%;
	font-size: 18px;
}

.ct1 {
	background-color: #fff;
	padding: 30px 40px;
	border-radius: 10px;
}

.ct2 {
	background-color: #fff;
	padding: 30px 20px;
	border-radius: 10px;
}

.product-image img {
	width: 100%;
	height: 100%;
}

.sp-km {
	padding-top: 15px;
	border-top: 1px dotted green;
	padding: 15px 0px 10px 15px
}

.sp-km li {
	font-size: 15px;
}

.sp-km p {
	font-size: 15px;
	line-height: 16px;
}

.sp-km i {
	font-size: 14px;
	line-height: 16px;
}

.sp-km .ico {
	color: #0c78aa;
}

.san-pham-ct p {
	margin-top: -5px;
	color: #616060;
}

.san-pham-ct b {
	color: #076692;
}

.san-pham-ct u {
	color: #fa0606;
	font-weight: bold;
	font-size: x-large;
}
</style>