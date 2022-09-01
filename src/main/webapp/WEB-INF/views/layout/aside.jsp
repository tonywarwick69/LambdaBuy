<!--  <%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />

<div class="panel panel-default">
	<div class="panel-heading"><s:message code="lyt.cart.title"/></div>
	<div class="panel-body">
		<img id="cart-img" src="/static/images/shopping_cart.gif" class="col-sm-5">
		<ul  class="col-sm-7">
			<li class="cart-cnt"><b>${cart.count}</b> mặt hàng</li>
			<li class="cart-amt"><b><f:formatNumber value="${cart.amount}" pattern="#,###"/></b> VNĐ</li>
			<li>
				<a href="/cart/view">Xem giỏ hàng</a>
			</li>
		</ul>
	</div>
</div>






<div class="panel panel-default">
	<div class="panel-heading">TÌM KIẾM:</div>
	<div class="panel-body">
		<form action="/product/list-by-keywords" method="post">
			<input value="${param.keywords}" class="form-control" name="keywords" placeholder="Keywords" />
		</form>
	</div>
</div>


<div class="panel panel-default">
	<div class="panel-heading"><s:message code="lyt.cate.title"/></div>
	<div class="list-group">
		<c:forEach var="c" items="${cates}">
			<a href="/product/list-by-category/${c.id}" class="list-group-item">${c.nameVN}</a> 
		</c:forEach>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">ĐẶC BIỆT</div>
	<div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item">Hàng mới</a> 
		<a href="/product/list-by-special/1" class="list-group-item">Bán chạy</a> 
		<a href="/product/list-by-special/2" class="list-group-item">Xem nhiều</a>
		<a href="/product/list-by-special/3" class="list-group-item">Giảm giá</a>
		<a href="/product/list-by-special/4" class="list-group-item">Đặc biệt</a>
	</div>
</div>

<style id="cart-css">
	
</style>

-->