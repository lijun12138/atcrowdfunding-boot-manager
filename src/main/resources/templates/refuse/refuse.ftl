<!DOCTYPE html>
<html lang="zh-CN">
  
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cover Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${APP_PATH }/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">


          <div class="inner cover">
            <h1 class="cover-heading">你的权限不足</h1>
            <p class="lead">请不要随便乱访问，如果你硬要访问，请打死你们公司的超管，然后你就是超管，就能查看了，祝你好运！！！！！！！</p>
            <p class="lead">
              <a href="#" id="hh" class="btn btn-lg btn-default">传送门</a>
            </p>
          </div>


        </div>

      </div>

    </div>

    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	$("#hh").click(function(){
    		alert("你以为是啥，点什么点！！！！辣鸡");
    	})
    </script>
  </body>

</html>
