<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/24
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html class="" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Simple-Product</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- all css here -->
    <!-- bootstrap v3.3.6 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link href="${pageContext.request.contextPath}/css/shopdetail.css" rel="stylesheet">
    <!-- <script src="./detail/js/jquery.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>

    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/detail.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var showproduct = {
                "boxid": "showbox",
                "sumid": "showsum",
                "boxw": 400,
                "boxh": 550,
                "sumw": 60, //列表每个宽度,该版本中请把宽高填写成一样
                "sumh": 60, //列表每个高度,该版本中请把宽高填写成一样
                "sumi": 7, //列表间隔
                "sums": 5, //列表显示个数
                "sumsel": "sel",
                "sumborder": 1, //列表边框，没有边框填写0，边框在css中修改
                "lastid": "showlast",
                "nextid": "shownext"
            }; //参数定义
            $.ljsGlasses.pcGlasses(showproduct); //方法调用，务必在加载完后执行

            $(function() {

                $('.tabs a').click(function() {

                    var $this = $(this);
                    $('.panel').hide();
                    $('.tabs a.active').removeClass('active');
                    $this.addClass('active').blur();
                    var panel = $this.attr("href");
                    $(panel).show();
                    return fasle; //告诉浏览器  不要纸箱这个链接
                }); //end click


                $(".tabs li:first a").click(); //web 浏览器，单击第一个标签吧

            }); //end ready

            $(".centerbox li").click(function() {
                $("li").removeClass("now");
                $(this).addClass("now");

            });
        });
    </script>

</head>

<body>
<!--zoom elavator area one start-->
<div class="elavator_area">
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div class="shop_menu shop_menu_2">
            <ul class="cramb_area cramb_area_5 main-detail-nav">
                <li><a href="index.html">首页 /</a></li>
                <%--<li><a href="index.html">Shop /</a></li>
                <li><a href="index.html">Headlight/</a></li>
                <li><a href="index.html">Hats /</a></li>--%>
                <li class="br-active">商品名</li>
            </ul>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                <div class="shopdetails">
                    <div id="leftbox">
                        <div id="showbox">
                            <img src="${pageContext.request.contextPath}/image/img02.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img03.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img04.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img05.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img01.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img04.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img05.png" width="400" height="400" />
                            <img src="${pageContext.request.contextPath}/image/img01.png" width="400" height="400" />
                        </div>
                        <div id="showsum">
                        </div>
                        <p class="showpage">
                            <a href="javascript:void(0);" id="showlast"> < </a>
                            <a href="javascript:void(0);" id="shownext"> > </a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="elav_titel">
                    <div class="elv_heading">
                        <h3>Cras nec nisl ut erat</h3>
                    </div>
                    <div class="price_rating">
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a href="#">
                            <i class="fa fa-star"></i>
                        </a>
                        <a class="not-rated" href="#">
                            <i class="fa fa-star-o"></i>
                        </a>
                        <a class="review-link" href="#">
                            (
                            <span class="count">2</span>
                            customer reviews)
                        </a>
                    </div>
                    <!-- <div class="evavet_description">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere metus vitae arcu imperdiet, id aliquet ante scelerisque. Sed sit amet sem vitae urna fringilla tempus.</p>
                    </div> -->
                </div>
                <div class="elav_info">
                    <!-- 价格 -->
                    <div class="price_box price_box_acr">
                        <span class="old- price old- price-2">$250.00</span>
                        <span class="spical-price spical-price-2">$200.00</span>
                    </div>
                    <div class="new_meta">
                            <span class="sku_wrapper big-font">
                                类别:
                                <span class="sku">W-hat-8</span>
                            </span>
                        <span class="sku_wrapper big-font">
                                数量:
                                <span class="sku">W-hat-8</span>
                            </span>
                    </div>
                    <div class="new_meta">
                            <span class="sku_wrapper big-font">
                                优惠:
                                <span class="sku">W-hat-8</span>
                            </span>

                    </div>


                    <div class="add_defi new_meta">
                        <a href="#" data-original-title="Add to Wishlist" data-toggle="tooltip" class=" big-font">
                            <i class="fa fa-commenting"></i>
                            联系客服
                        </a>
                    </div>
                    <form class="cart-btn-area new_meta" action="#">
                        <input type="number" value="1">
                        <button class="add-tocart cart_zpf" type="submit">加入购物车</button>
                    </form>
                    <div class="add_defi new_meta">
                        <a href="#" data-original-title="Add to Wishlist" data-toggle="tooltip" class=" big-font">
                            <i class="fa fa-heart"></i>
                            收藏
                        </a>
                    </div>

                    <!-- <div class="add_defi_2">
                        <a data-original-title="Compare" title="" data-toggle="tooltip" rel="nofollow" data-product_id="45" href=""><i class="fa fa-refresh another_icon"></i> Compare</a>
                    </div> -->

                </div>
            </div>
            <!-- <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">

        </div> -->
        </div>
    </div>
</div>
<!--zoom elavator area one end-->
<!--tab area start-->
<div class="tab_area_start">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 text-right">
                <div class="my-tabs">
                    <!-- Nav tabs -->
                    <ul class="favtabs favtabs-2 favtabs-nytr" role="tablist">
                        <%--<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Discription</a></li>--%>
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">商品描述</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">评价 (2)</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <div class="tb_desc">
                                        <h2>商品描述</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla. Donec a neque libero. Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante.</p>
                                        <p>Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Nam erat mi, rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a dapibus enim lorem nec augue.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <div class="tb_desc">
                                        <div class="review_area_heading">
                                            <div id="comnt">
                                                <h2>2条评论</h2>
                                                <ol class="commentlist">
                                                    <li id="li-comment-22" class="comment even thread-even depth-1" itemscope="" >
                                                        <div id="comment-22" class="comment_container">
                                                            <img class="avatar avatar-60 photo" width="60" height="60" src="img/icon/men_icon.jpg" alt="">
                                                            <div class="comment-text">
                                                                <div class="star-rating" title="Rated 4 out of 5" itemscope="">
                                                                    <div class="price_rating price_rating_2">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a class="not-rated" href="#">
                                                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                                                        </a>
                                                                        <span>
                                                                                <strong >4</strong>
                                                                                out of 5
                                                                            </span>
                                                                    </div>
                                                                </div>
                                                                <p class="meta">
                                                                    <strong>admin</strong>
                                                                    –
                                                                    <time datetime="2015-12-16T15:26:49+00:00">December 16, 2015</time>
                                                                    :
                                                                </p>
                                                                <div class="description">
                                                                    <p>like</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li  class="comment even thread-even depth-1" itemscope="">
                                                        <div class="comment_container">
                                                            <img class="avatar avatar-60 photo" width="60" height="60" src="img/icon/men_icon.jpg" alt="">
                                                            <div class="comment-text">
                                                                <div class="star-rating" title="Rated 4 out of 5" itemscope="">
                                                                    <div class="price_rating price_rating_2">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a class="not-rated" href="#">
                                                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                                                        </a>
                                                                        <span>
                                                                                <strong>4</strong>
                                                                                out of 5
                                                                            </span>
                                                                    </div>
                                                                </div>
                                                                <p class="meta">
                                                                    <strong >alex</strong>
                                                                    –
                                                                    <time datetime="2015-12-16T15:26:49+00:00">December 18, 2015</time>
                                                                    :
                                                                </p>
                                                                <div class="description">
                                                                    <p>google</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="review_form_area">
                                                <div class="review_form">
                                                    <div class="revew_form_content">
                                                        <h3 id="reply-title" class="comment-reply-title">
                                                            Add a review
                                                            <small>
                                                                <a id="cancel-comment-reply-link" style="display:none;" href="#" rel="nofollow">Cancel reply</a>
                                                            </small>
                                                        </h3>
                                                        <form id="commentform" class="comment-form" method="post" action="form">
                                                            <div class="comment-form-rating">
                                                                <label class="comment">Your Rating</label>
                                                                <div class="price_rating price_rating_2 price_rating_3">
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="comment-form-comment">
                                                                <label class="comment">Your Review</label>
                                                                <textarea id="comment" aria-required="true" rows="8" cols="45" name="comment"></textarea>
                                                            </div>
                                                            <div class="comment-form-author">
                                                                <label class="comment">
                                                                    Name
                                                                    <span class="required required_menu">*</span>
                                                                </label>
                                                                <input id="author" class="mix_type" type="text" aria-required="true" size="30" value="" name="author">
                                                            </div>
                                                            <div class="comment-form-email">
                                                                <label class="comment">
                                                                    Email
                                                                    <span class="required required_menu">*</span>
                                                                </label>
                                                                <input id="email" class="mix_type" type="text" aria-required="true" size="30" value="" name="email">
                                                            </div>
                                                            <div class="form-submit">
                                                                <input id="sub" class="submt" type="submit" value="Submit" name="submit">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--tab area end-->
<!-- jquery latest version -->
<!-- <script src="js/vendor/jquery-1.12.0.min.js"></script> -->
<!-- bootstrap js -->
<!-- <script src="js/bootstrap.min.js"></script> -->

</body>
</html>


