<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sentiment Analysis Demo of Bjfu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <% String path = request.getContextPath(); %>
    <base href="<%=path%>">

    <!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->

    <link rel="stylesheet" href="/static/css/animate.css">
    <link rel="stylesheet" href="/static/css/flexslider.css">
    <link rel="stylesheet" href="/static/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1012673_q1pp9wrsph.css">
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">

</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">


<div class="container">
    <template>
        <div>
            <el-radio-group v-model="radio3">
                <el-radio-button label="上海"></el-radio-button>
                <el-radio-button label="北京"></el-radio-button>
                <el-radio-button label="广州"></el-radio-button>
                <el-radio-button label="深圳"></el-radio-button>
            </el-radio-group>
        </div>
        <div style="margin-top: 20px">
            <el-radio-group v-model="radio4" size="medium">
                <el-radio-button label="上海" ></el-radio-button>
                <el-radio-button label="北京"></el-radio-button>
                <el-radio-button label="广州"></el-radio-button>
                <el-radio-button label="深圳"></el-radio-button>
            </el-radio-group>
        </div>
        <div style="margin-top: 20px">
            <el-radio-group v-model="radio5" size="small">
                <el-radio-button label="上海"></el-radio-button>
                <el-radio-button label="北京" disabled ></el-radio-button>
                <el-radio-button label="广州"></el-radio-button>
                <el-radio-button label="深圳"></el-radio-button>
            </el-radio-group>
        </div>
        <div style="margin-top: 20px">
            <el-radio-group v-model="radio6" disabled size="mini">
                <el-radio-button label="上海"></el-radio-button>
                <el-radio-button label="北京"></el-radio-button>
                <el-radio-button label="广州"></el-radio-button>
                <el-radio-button label="深圳"></el-radio-button>
            </el-radio-group>
        </div>
    </template>

    <script>
        export default {
            data () {
                return {
                    radio3: '上海',
                    radio4: '上海',
                    radio5: '上海',
                    radio6: '上海'
                };
            }
        }
    </script>
</div>




<footer class="site-footer bg-light">
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12 text-center">
                <p>
                    <a href="https://github.com/cnyy7" class="social-item"><span class="icon-github2"></span></a>
                    <a href="https://www.zhihu.com/people/chen-nan-55" class="social-item"><span
                            class="fab fa-zhihu"></span></a>
                    <a href="https://yayawonder.netlify.com/yaya.html" class="social-item"><span
                            class="iconfont icon-yueryingerbaby-yaziduckquac"></span></a>
                    <a href="https://mp.weixin.qq.com/s?__biz=MzU3NDc1ODkxOQ==&mid=2247483675&idx=1&sn=79384586d758b29aedcf6a275dfae5a5&chksm=fd2cc873ca5b4165ea18824e86b4b4c07bd8c2d6812e8c7a9f18130462f5d79acc0fb34996a3&xtrack=1&scene=0&subscene=131&clicktime=1547283295&ascene=7&devicetype=android-27&version=27000038&nettype=WIFI&abtest_cookie=BQABAAoACwASABMAFAAGACaXHgBXmR4Am5keAJ2ZHgClmR4At5keAAAA&lang=zh_CN&pass_ticket=C6r1Ne3gjNwqLwHfl%2F7Gly8vqamKcCMXat%2FTVlWTBqg%3D&wx_header=1"
                       class="social-item"><span class="fas fa-cat"></span></a>
                    <%--<a href="#" class="social-item"><span class="icon-linkedin2"></span></a>--%>
                    <%--<a href="#" class="social-item"><span class="icon-vimeo"></span></a>--%>
                </p>
            </div>
        </div>
        <div class="row">
            <p class="col-12 text-center">

                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script>
                - cnyy All rights reserved

            </p>
        </div>
    </div>
</footer>
<script src="/static/js/vendor/jquery.min.js"></script>
<script src="/static/js/vendor/popper.min.js"></script>
<script src="/static/js/vendor/bootstrap.min.js"></script>

<script src="/static/js/vendor/jquery.easing.1.3.js"></script>
<script src="/static/js/vendor/jquery.stellar.min.js"></script>
<script src="/static/js/vendor/jquery.waypoints.min.js"></script>

<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script src="/static/js/custom.js"></script>


</body>
</html>