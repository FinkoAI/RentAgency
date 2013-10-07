<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title><?php echo $title; ?></title>


  <?php echo $styles; ?>
  <style> <?php echo $custom_css; ?> </style>

  <link href="/assets/css/bootstrap.css" rel="stylesheet">
  <link href="/assets/css/style.css" rel="stylesheet">
  <link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">

</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
<div class="navbar-inner">
  <div class="container-fluid">
    <a class="brand" href="/">Panel</a>
    <div class="nav-collapse collapse">
      <ul class="nav">
        <li class="active"><a href="/">Недвижимость</a></li>

<?php if($is_admin): ?>
        <li><a href="/admin/">Панель управления</a></li>
<?php endif; ?>
      </ul>
      <p class="navbar-text pull-right">
        <!-- Logged in as  -->
        <a href="/user/logout" class="navbar-link">Выход</a>
      </p>
    </div><!--/.nav-collapse -->
  </div>
</div>
</div>

<!-- Контент -->
<?php echo $content; ?>


<!--  Подключение файлов javascript -->
<script src="/assets/js/jquery-1.9.1.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<?php echo $scripts; ?>
<script type="text/javascript"> <?php echo $custom_js; ?> </script>

</body>
</html>
