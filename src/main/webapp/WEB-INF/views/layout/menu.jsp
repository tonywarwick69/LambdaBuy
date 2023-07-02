<%@ page pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!--  
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home/index">
				<s:message code="lyt.menu.home"/>
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/home/about"><s:message code="lyt.menu.about"/></a></li>
			<li><a href="/home/contact"><s:message code="lyt.menu.contact"/></a></li>
			<li><a href="/home/feedback"><s:message code="lyt.menu.feedback"/></a></li>
			<li><a href="/home/faq"><s:message code="lyt.menu.faqs"/></a></li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"><s:message code="lyt.menu.account"/> <span class="caret"></span></a>
				<c:choose>
					<c:when test="${empty sessionScope.user }">
						<ul class="dropdown-menu">
							<li><a href="/account/login">Login</a></li>
							<li><a href="/account/register">Register</a></li>
							<li><a href="/account/forgot">Forgot password</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu">
							<li><a href="/account/logout">Log Out</a></li>
							<li><a href="/account/change">Change password</a></li>
							<li><a href="/account/edit">Update Account</a></li>
							<li><a href="/order/list">Order</a></li>
							<li><a href="/order/items">Goods purchases</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" data-lang="vi">Tiếng Việt</a></li>
			<li><a href="#" data-lang="en">English</a></li>
		</ul>
	</div>
</nav>
	<script>
		$(function(){
			$("a[data-lang]").click(function(){
				var lang = $(this).attr("data-lang");
				$.ajax({
					url:"/home/language?lang="+lang,
					success:function(){
						location.reload();
					}	
				});
				return false;
			})
		)};
	</script>
-->
<style type="text/css">
  .nav-item {
    width: 240px;
    text-align: center;
    font-weight: bold;
    color: white;

    
  }

  .nav-item:hover {
    background-color: #0047AB;
  }

  .nav-link:hover {
    background-color: #0047AB;
  }
  .container-fluid{
  	
  }
</style>
<nav
  class="navbar navbar-expand-sm navbar-dark"
  style="margin-top: -20px; background-color: #111111"
>
  <div class="container-fluid" style="width:100%; height: 30px; padding: 0px 60px 0px 60px">
    <ul class="navbar-nav" style="margin-right: 450px">
      <li style="width: 280px; font-size: 18px; border-right: 1px solid gray">
        <a
          class="nav-link"
          style="cursor: pointer; font-weight: bold; color: #E5B80B;"
          data-toggle="collapse"
          href="#chungloai">
          <i class="fa fa-navicon"></i>&nbsp;&nbsp;
          <span class="danh_muc">DANH MỤC SẢN PHẨM</span>
        </a>
      </li>
      <li class="nav-item" style="margin-left: 12px">
        <a class="nav-link" style="color: #E5B80B" href="/">TRANG CHỦ</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" style="color: #E5B80B" href="/about">GIỚI THIỆU</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="color: #E5B80B" href="/contact">LIÊN HỆ</a>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link" style="color: white" href="/feedback">PHẢN HỒI</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" style="color: #E5B80B" href="/faq">HỎI ĐÁP</a>
      </li>
      <!-- Dropdown -->
      <li class="nav-item dropdown">
        <a
          style="color: #E5B80B"
          class="nav-link dropdown-toggle"
          href="#"
          id="navbardrop"
          data-toggle="dropdown"
        >
          TÀI KHOẢN: ${sessionScope.user.id}
        </a>
        <c:choose>
          <c:when test="${empty sessionScope.user }">
            <ul class="dropdown-menu">
              <li><a href="/account/login">Đăng nhập</a></li>
              <li><a href="/account/register">Đăng ký</a></li>
              <li><a href="/supplier/register">Đăng ký trở thành Người bán trên LambdaBuy</a></li>
              <li><a href="/account/forgot">Quên mật khẩu?</a></li>
              <li><a href="/admin/login">Trang quản lý LambdaBuy</a></li>
              <li><a href="/supplier/login">Trang nhà bán hàng</a></li>
            </ul>
          </c:when>
          <c:otherwise>
            <ul class="dropdown-menu" style="background-color: #fff">
              <li style="border-bottom: 2px solid #eeeeee">
                <a href="/account/logout">Đăng xuất</a>
              </li>
              <li style="border-bottom: 2px solid #eeeeee">
                <a href="/account/change">Thay đổi mật khẩu</a>
              </li>
              <li style="border-bottom: 2px solid #eeeeee">
                <a href="/account/edit">Cập nhật thông tin cá nhân</a>
              </li>
              <li style="border-bottom: 2px solid #eeeeee">
                <a href="/order/list">Lịch sử đơn hàng</a>
              </li>
              <li><a href="/order/items">Danh sách sản phẩm đã mua</a></li>
            </ul>
          </c:otherwise>
        </c:choose>
      </li>
    </ul>
  </div>
</nav>

<div
  class="list_danh_muc"
  style="
    position: absolute;
    z-index: 1;
    display: none;
    width: 350px;
    padding-left: 70px;
    margin-top: -20px;">
  <c:forEach var="c" items="${cates}">
    <a class="list-group-item" href="/product/list-by-categorys/${c.id}">
      <img src="/static/images/icon/4.png" />${c.name}
    </a>
  </c:forEach>
</div>

<style>
  .list-group-item {
    background-color: #f8f8ff;
    border-bottom: 2px solid #eeeeee;
  }

  .list-group-item:hover {
    color: #E5B80B;
    font-weight: bold;
  }
  .list_danh_muc a:hover{
  	color:#E5B80B ;
  }
  
</style>
