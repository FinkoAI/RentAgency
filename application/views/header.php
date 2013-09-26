<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title><?php echo $title; ?></title>

  <link href="/assets/css/bootstrap.css" rel="stylesheet">
  <link href="/assets/css/style.css" rel="stylesheet">
  <link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">

  <script src="/assets/js/jquery-1.9.1.min.js"></script>
  <script src="/assets/js/bootstrap.min.js"></script>

</head>

<body>

  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container-fluid">
        <a class="brand" href="/">RentAgency</a>
        <div class="nav-collapse collapse">
          <ul class="nav">
            <li class="active"><a href="/realty/">Недвижимость</a></li>
            <li><a href="/admin/">Панель администратора</a></li>
          </ul>
          <p class="navbar-text pull-right">
            <!-- Logged in as  -->
            <a href="/user/logout" class="navbar-link">Выход</a>
          </p>
        </div><!--/.nav-collapse -->
      </div>
    </div>
  </div>
