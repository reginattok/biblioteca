<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CRUD de productos con PHP - MySQL - jQuery AJAX </title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/custom.css">
  <style media="screen">
  footer {
    background-color:#1A1A1A;
    height: 15%;
    color: white;
    padding: 15px;
  }
  </style>
</head>

<body>

  <nav id="navbar" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <span class="navbar-brand">
          <span>
            <img src="img/fotocopia.png" style="height: 44px; margin-top: -14px;">
          </span>
        </span>
        <span class="navbar-brand">
          <span class="hidden-xs"><strong>Fotocopias "El Original"</strong></span>
        </span>

      </div>
      <div class="navbar-collapse collapse" id="navnav">
        <ul id="nav-menu" class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="VerCarrito.php"><span class="glyphicon glyphicon-shopping-cart"></span>
              <?php if ($cart->total_items()) echo "<span class='badge badge-notify'>".$cart->total_items()."</span>";?>
            </a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="glyphicon glyphicon-user"></i>
              julian
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li>
                <a href="authLogout.php"><span class="glyphicon glyphicon-log-out">&nbsp;</span>Salir</a>
              </li>
            </ul>
          </li>
        </ul>

        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="index.php"><span class="glyphicon glyphicon-home"></span> </a>
          </li>

          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="glyphicon glyphicon-list"></i>
              Tablas
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="productosListadoAdmin.php" title="Tabla de Articulos">
                <i class="fa fa-book" aria-hidden="true"></i>&nbsp;Articulos
              </a>
            </li>
            <li><a href="clientesListadoAdmin.php" title="Tabla de Clientes">
               <i class="fa fa-address-book" aria-hidden="true"></i>&nbsp;Clientes
            </a>
          </li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <i class="glyphicon glyphicon-tag"></i>
            Ventas
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#" title="Listado de Articulos">
              <i class="fa fa-gift" aria-hidden="true"></i>&nbsp;Listado de Articulos
            </a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <i class="glyphicon glyphicon-cog"></i>
            Actualizacion
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="importarProductos.php" title="Listado de Articulos">
              <i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;Importar Archivo
            </a></li>
          </ul>
        </li>


      </ul>

    </div>
  </div>
</nav>


<div class="container">
  <br><br>
  <div class="table-wrapper">
    <div class="table-title">
      <div class="row">
        <div class="col-sm-6">
          <h2>Administrar <b>Productos</b></h2>
        </div>
      </div>
    </div>
    <div class='col-sm-4 pull-right'>
      <div id="custom-search-input">
        <div class="input-group col-md-12">
          <input type="text" class="form-control" placeholder="Buscar"  id="q" onkeyup="load(1);" />
          <span class="input-group-btn">
            <button class="btn btn-info" type="button" onclick="load(1);">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>
        </div>
      </div>
    </div>
    <div class='clearfix'></div>
    <hr>
    <div id="loader"></div><!-- Carga de datos ajax aqui -->
    <div id="resultados"></div><!-- Carga de datos ajax aqui -->
    <div class='outer_div'></div><!-- Carga de datos ajax aqui -->


  </div>
</div>
<!-- Edit Modal HTML -->
<?php include("html/modal_add.php");?>
<!-- Edit Modal HTML -->
<?php include("html/modal_edit.php");?>
<!-- Delete Modal HTML -->
<?php include("html/modal_delete.php");?>


<footer class="navbar navbar-fixed-bottom">
  <div class="container">
    <div class="col-xs-12 col-md-6">
      <h6 class="text-muted lead">CONTACTO:</h6>
      <span class="text-muted">
        jfontanellaz@gmail.com - Teléfonos: 342-5163923.
      </span>
    </div>
    <div class="col-xs-12 col-md-6">
      <div class="row"> <p class="text-muted small text-right">AUS. Javier Fontanellaz @2019. <br> Todos los derechos reservados.</p></div>
    </div>
  </div>
</footer>



<script type="text/javascript">
$(function() {
      load(1);
    });

    function load(page){
      var query=$("#q").val();
      var per_page=3;
      var parametros = {"action":"ajax","page":page,'query':query,'per_page':per_page};
      
      $("#loader").fadeIn('slow');
      
      $.ajax({
        url:'ajax/sociosListado.php',
        data: parametros,
         beforeSend: function(objeto){
        $("#loader").html("Cargando...");
        },
        success:function(data){
          $(".outer_div").html(data).fadeIn('slow');
          $("#loader").html("");
        }
      })
    }
</script>
</body>
</html>
