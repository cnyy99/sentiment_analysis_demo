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
    <script src="/static/js/vendor/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1012673_q1pp9wrsph.css">
    <link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300" type="text/css" />

    <style>
    body {
        width: 100wh;
        height: 90vh;
        color: #fff;
        background: linear-gradient(-45deg, #EE7752, #E73C7E, #23A6D5, #23D5AB);
        background-size: 400% 400%;
        -webkit-animation: Gradient 15s ease infinite;
        -moz-animation: Gradient 15s ease infinite;
        animation: Gradient 15s ease infinite;
    }

    @-webkit-keyframes Gradient {
        0% {
            background-position: 0% 50%
        }
        50% {
            background-position: 100% 50%
        }
        100% {
            background-position: 0% 50%
        }
    }

    @-moz-keyframes Gradient {
        0% {
            background-position: 0% 50%
        }
        50% {
            background-position: 100% 50%
        }
        100% {
            background-position: 0% 50%
        }
    }

    @keyframes Gradient {
        0% {
            background-position: 0% 50%
        }
        50% {
            background-position: 100% 50%
        }
        100% {
            background-position: 0% 50%
        }
    }

    h1,
    h6 {
        font-family: 'Open Sans';
        font-weight: 300;
        text-align: center;
        position: absolute;
        top: 45%;
        right: 0;
        left: 0;
    }
</style>
</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">
<script type="text/javascript">
    $(document).ready(function () {
        console.log("da");
        $('#site-form').submit(function () {	//这次我们这么绑定
            var message = $("textarea[name='message']").val();
            // var title = $("input[name='title']").val();
            console.log(message)
            // var errmessage = $("textarea[name='errmessage']").val();
            var data = {
                message: message,
                type:app.picked
            };
            $.ajax({
                url: '/data/analy',
                type: 'POST',
                async: false,
                dataType: "json",
                data: data,
                success: function (dataa) {
                    typeArr = ["正面情绪", "负面情绪"];
                    // var dataArr=eval('(' + dataa + ')')[0];
                    console.log(dataa);
                    console.log(dataa.result);
                    piePicture("img", typeArr, dataa.result);
                    // console.log(dataArr);
                },
                fail: function () {
                }
            });
            // axios.post('/data/analy', {
            //     message:message
            // })
            // .then(function (response) {
            //     typeArr=["正面情绪","负面情绪"];
            //     dataArr=response[0];
            //     piePicture("img",typeArr,dataArr);
            //     console.log(response);
            // })
            // .catch(function (error) {
            //     console.log(error);
            // });
            return false;	//还是要return false, 跟上面一样的道理
        });
    });
    // 饼状图的方法
    // 对应放图片的 Id（imageId）
    //typeArr: 对应名称的数组
    //dataArr: 对应名称数组的对应数据的数组
    function piePicture(imageId, typeArr, dataArr) {
        var ListFirstArr = [];
        for (var i = 0; i < typeArr.length; i++) {
            var item = {
                value: dataArr[i],
                name: typeArr[i]
            };
            console.log(item);
            ListFirstArr.push(item);
        }
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/pie' // 使用柱状图就加载 bar 模块，按需加载
            ],
            function (ec) {
                // 基于准备好的 dom，初始化 echarts 图表
                var myChart = ec.init(document.getElementById(imageId));
                option = {
                    title: {
                        text: '',
                        subtext: '',
                        x: 'left'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: '10%',
                        data: typeArr
                    },
                    series: [
                        {
                            name: ' 文本情感 ',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: ListFirstArr,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                myChart.setOption(option);
            }
        )
    };
</script>
<div class="col-md-3">
    <div id="example-4">
        <input type="radio" id="one" value="1" v-model="picked">
        <label for="one">通用</label>
        <br>
        <input type="radio" id="two" value="2" v-model="picked">
        <label for="two">汽车</label>
        <br>
        <input type="radio" id="three" value="3" v-model="picked">
        <label for="three">厨具</label>
        <br>
        <input type="radio" id="four" value="4" v-model="picked">
        <label for="four">餐饮</label>
        <br>
        <input type="radio" id="five" value="5" v-model="picked">
        <label for="five">新闻</label>
        <br>
        <input type="radio" id="six" value="6" v-model="picked">
        <label for="six">微博</label>
        <br>

        <span>Picked: {{ picked }}</span>
    </div>
    <script>
        var app=new Vue({
            el: '#example-4',
            data: {
                picked: '1'
            }
        })
    </script>
</div>
<div class="col-md-6 offset-3">
    <form class="site-form" id="site-form">
        <label>
            <textarea class="form-control px-3 py-3" cols="30" rows="10" name="message"></textarea>
        </label>
        <input type="submit" class="btn btn-primary  px-4 py-3"
               value="Leave Message">
    </form>
</div>

<div class="container">
    <div class="col-md-6 offset-3">
        <div id="img" style="height:400px"></div>
    </div>
</div>
<footer class="site-footer bg-light">
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12 text-center">
                <p>
                    <a href="https://github.com/Text-sentiment-analysis-bjfu" class="social-item" target="_blank"><span
                            class="icon-github2"></span></a>
                    <a href="https://zh.wikipedia.org/zh-hans/%E6%96%87%E6%9C%AC%E6%83%85%E6%84%9F%E5%88%86%E6%9E%90"
                       class="social-item" target="_blank"><span
                            class="fa fa-wikipedia-w"></span></a>
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
<script src="/static/js/vendor/popper.min.js"></script>
<script src="/static/js/vendor/bootstrap.min.js"></script>
<script src="/static/js/vendor/jquery.easing.1.3.js"></script>
<script src="/static/js/vendor/jquery.stellar.min.js"></script>
<script src="/static/js/vendor/jquery.waypoints.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script src="/static/js/custom.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>

</body>
</html>