<!DOCTYPE html>
<html>
<?php
include "configuration/config_etc.php";
include "configuration/config_include.php";
include "configuration/config_alltotal.php";
etc();encryption();session();connect();head();body();timing();
//alltotal();
pagination();
?>
<?php
$decimal ="0";
$a_decimal =",";
$thousand =".";
?>
<?php
if (!login_check()) {
?>
<meta http-equiv="refresh" content="0; url=logout" />
<?php
exit(0);
}
?>
<div class="wrapper">
<?php
theader();
menu();
?>
            <div class="content-wrapper">
                <section class="content-header">
</section>
                <section class="content">
                    <div class="row">
                      <div class="col-lg-12">
<!-- SETTING START-->

<?php
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
include "configuration/config_chmod.php";
$halaman = "pembelian"; // halaman
$dataapa = "Invoice Pembelian"; // data
$tabeldatabase = "invoicebeli"; // tabel database
$tabel = "buy"; // tabel database
$chmod = $chmenu5; // Hak akses Menu
$forward = mysqli_real_escape_string($conn, $tabel); // tabel database
$forwardpage = mysqli_real_escape_string($conn, $halaman); // halaman
$search = $_POST['search'];

?>

<!-- SETTING STOP -->
<?php
$decimal ="0";
$a_decimal =",";
$thousand =".";
?>


<!-- BREADCRUMB -->

<ol class="breadcrumb ">
<li><a href="<?php echo $_SESSION['baseurl']; ?>">Dashboard </a></li>
<li><a href="<?php echo $halaman;?>"><?php echo $dataapa ?></a></li>
<?php

if ($search != null || $search != "") {
?>
 <li> <a href="<?php echo $halaman;?>">Data <?php echo $dataapa ?></a></li>
  <li class="active"><?php
    echo $search;
?></li>
  <?php
} else {
?>
 <li class="active">Data <?php echo $dataapa ?></li>
  <?php
}
?>
</ol>

<!-- BREADCRUMB -->
<!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3 style="font-size: 30px"><sup style="font-size: 20px">Rp</sup><?php echo number_format($inv11, $decimal, $a_decimal, $thousand);?></h3>

              <p>Total pembelian</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3 style="font-size: 30px"><sup style="font-size: 20px">Rp</sup><?php echo number_format($inv12, $decimal, $a_decimal, $thousand);?></h3>

              <p>Total Lunas</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3 style="font-size: 30px"><sup style="font-size: 20px">Rp</sup><?php echo number_format($inv13, $decimal, $a_decimal, $thousand);?></h3>

              <p>Total Tagihan</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 style="font-size: 30px"><sup style="font-size: 20px">Rp</sup><?php echo number_format($inv14, $decimal, $a_decimal, $thousand);?></h3>

              <p>Tagihan Jatuh Tempo</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->

<!-- BOX HAPUS BERHASIL -->

         <script>
 window.setTimeout(function() {
    $("#myAlert").fadeTo(500, 0).slideUp(1000, function(){
        $(this).remove();
    });
}, 5000);
</script>

                            <?php
$hapusberhasil = $_POST['hapusberhasil'];

if ($hapusberhasil == 1) {
?>
    <div id="myAlert"  class="alert alert-success alert-dismissible fade in" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Berhasil!</strong> <?php echo $dataapa;?> telah berhasil dihapus dari Data <?php echo $dataapa;?>.
</div>

<!-- BOX HAPUS BERHASIL -->
<?php
} elseif ($hapusberhasil == 2) {
?>
           <div id="myAlert" class="alert alert-success alert-dismissible fade in" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Berhasil!</strong> <?php echo $dataapa;?> tidak bisa dihapus dari Data <?php echo $dataapa;?> karena telah melakukan transaksi sebelumnya, gunakan menu update untuk merubah informasi <?php echo $dataapa;?> .
</div>
<?php
} elseif ($hapusberhasil == 8) {
?>
           <div id="myAlert" class="alert alert-success alert-dismissible fade in" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Berhasil!</strong> <?php echo $dataapa;?> telah berhasil diupdate status barangnya, pastikan jangan terima bila barang rusak dan jangan konfirmasi bila belum terima barang!
</div>
<?php
} elseif ($hapusberhasil == 3) {
?>
           <div id="myAlert" class="alert alert-danger alert-dismissible fade in" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Gagal!</strong> Hanya user tertentu yang dapat mengupdate Data <?php echo $dataapa;?> .
</div>
<?php
}

?>
       <!-- BOX INFORMASI -->
    <?php
if ($chmod == '1' || $chmod == '2' || $chmod == '3' || $chmod == '4' || $chmod == '5' || $_SESSION['jabatan'] == 'admin') {
} else {
?>
   <div class="callout callout-danger">
    <h4>Info</h4>
    <b>Hanya user tertentu yang dapat mengakses halaman <?php echo $dataapa;?> ini .</b>
    </div>
    <?php
}
?>

<?php
if ($chmod >= 1 || $_SESSION['jabatan'] == 'admin') {
?>

<?php

        $sqla="SELECT no, COUNT( * ) AS totaldata FROM $forward";
        $hasila=mysqli_query($conn,$sqla);
        $rowa=mysqli_fetch_assoc($hasila);
        $totaldata=$rowa['totaldata'];

?>
                           <div class="box">
            <div class="box-header">
            <h3 class="box-title">Data <?php echo $dataapa ?>  <span class="label label-default"><?php echo $totaldata; ?></span>
                    </h3>

              <form method="post">
              <br/>
                <div class="input-group input-group-sm" style="width: 250px;">
                  <input type="text" name="search" class="form-control pull-right" placeholder="Cari">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>

                  </form>


            </div>

                                <!-- /.box-header -->
                                  <!-- /.Paginasi -->
                                 <?php
    error_reporting(E_ALL ^ E_DEPRECATED );
    $sql    = "select * from buy inner join supplier on buy.supplier=supplier.kode order by buy.nota desc";
    $result = mysqli_query($conn, $sql);
    $rpp    = 15;
    $reload = "$halaman"."?pagination=true";
    $page   = intval(isset($_GET["page"]) ? $_GET["page"] : 0);

    if ($page <= 0)
        $page = 1;
    $tcount  = mysqli_num_rows($result);
    $tpages  = ($tcount) ? ceil($tcount / $rpp) : 1;
    $count   = 0;
    $i       = ($page - 1) * $rpp;
    $no_urut = ($page - 1) * $rpp;
?>
                            <div class="box-body table-responsive">
                                    <table class="table table-hover ">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nota</th>
                                                <th>Due Date</th>
                                                <th>Supplier</th>
                                                <th>Total</th>
                                                <th>Kasir</th>
                                                <th>Status</th>
                                                <?php   if ($chmod >= 3 || $_SESSION['jabatan'] == 'admin') { ?>
                                                <th>Opsi</th>
                                                <?php }else{} ?>
                                            </tr>
                                        </thead>
                                          <?php
    error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
    $search = $_POST['search'];

    if ($search != null || $search != "") {

        if ($_SERVER["REQUEST_METHOD"] == "POST") {

                if(isset($_POST['search'])){
                $query1="SELECT * from buy inner join supplier on buy.supplier=supplier.kode where buy.nota like '%$search%' or supplier.nama like '%$search%' order by buy.nota DESC limit $rpp ";
                $hasil = mysqli_query($conn,$query1);
                $no = 1;
                while ($fill = mysqli_fetch_assoc($hasil)){
                    ?>
                     <tbody>
<tr>
                      <td><?php echo ++$no_urut;?></td>
                      <td><?php  echo mysqli_real_escape_string($conn, $fill['nota']); ?></td>
                      <td><?php $newtgl = date("d-m-Y",strtotime($fill['tglsale']));
                       echo mysqli_real_escape_string($conn, $newtgl); ?></td>
            <td><?php  echo mysqli_real_escape_string($conn, $fill['nama']); ?></td>
            <td><?php  echo mysqli_real_escape_string($conn, number_format($fill['total'], $decimal, $a_decimal, $thousand).',-'); ?></td>
                      <td><?php  echo mysqli_real_escape_string($conn, $fill['kasir']); ?></td>

                      <td><?php  echo mysqli_real_escape_string($conn, $fill['status']); ?></td>
                      
                      <td>
                      

                     <?php  if ($chmod >= 4 || $_SESSION['jabatan'] == 'admin') { ?>
                    <button type="button" class="btn btn-danger btn-xs" onclick="window.location.href='component/delete/delete_inv?nota=<?php echo $fill['nota'].'&'; ?>forward=<?php echo $forward.'&';?>forwardpage=<?php echo $forwardpage.'&'; ?>chmod=<?php echo $chmod; ?>'">Hapus</button>
                     <?php } else {}?>

           <?php  if ($chmod >= 4 || $_SESSION['jabatan'] == 'admin') { ?>
         
          <?php  if ($chmod >= 1 || $_SESSION['jabatan'] == 'admin') { ?>
          <?php if ($fill['status']!='Diterima'){?>
           
             <?php if ($fill['status']!='Diterima'){?>
             <button type="button" class="btn btn-success btn-xs no-print btn-flat" style="width:55px" onclick="window.location.href='invoice_beli?nota=<?php echo $fill['nota']?>'">Proses</button>
           <?php } } } } else {}?>







                          </td></tr><?php
                    ;
                }

                ?>
                  </tbody></table>
 <div align="right"><?php if($tcount>=$rpp){ echo paginate_one($reload, $page, $tpages);}else{} ?></div>
         <?php
            }

        }

    } else {
        while(($count<$rpp) && ($i<$tcount)) {
            mysqli_data_seek($result,$i);
            $fill = mysqli_fetch_array($result);
            ?>
                      <tbody>
<tr>
                      <td><?php echo ++$no_urut;?></td>
            <td><?php  echo mysqli_real_escape_string($conn, $fill['nota']); ?></td>
             <td><?php $newtgl = date("d-m-Y",strtotime($fill['tglsale']));
                       echo mysqli_real_escape_string($conn, $newtgl); ?></td>
            <td><?php  echo mysqli_real_escape_string($conn, $fill['nama']); ?></td>
            <td><?php  echo mysqli_real_escape_string($conn, number_format($fill['total'], $decimal, $a_decimal, $thousand).',-'); ?></td>
            <td><?php  echo mysqli_real_escape_string($conn, $fill['kasir']); ?></td>
            <td><?php  echo mysqli_real_escape_string($conn, $fill['status']); ?></td>
            
            <td>
                      
                     <?php  if (($chmod >= 4 || $_SESSION['jabatan'] == 'admin')&&($fill['status']!='Diterima') ) { ?>
             <button type="button" class="btn btn-danger btn-xs" onclick="window.location.href='component/delete/delete_inv?nota=<?php echo $fill['nota'].'&'; ?>forward=<?php echo $forward.'&';?>forwardpage=<?php echo $forwardpage.'&'; ?>chmod=<?php echo $chmod; ?>';myFunction()">Hapus</button>
                     <?php } else {}?>

             <?php  if ($chmod >= 1 || $_SESSION['jabatan'] == 'admin') { ?>
           <button type="button" class="btn btn-info btn-xs" onclick="window.location.href='Invoice_beli?nota=<?php echo $fill['nota']?>'">Detail</button>
           <?php } else {}?>

           <?php  if ($chmod >= 1 || $_SESSION['jabatan'] == 'admin') { ?>
          <?php if ($fill['status']!='Diterima'){?>
             <button type="button" class="btn btn-success btn-xs no-print btn-flat" style="width:55px" onclick="window.location.href='invoice_beli?nota=<?php echo $fill['nota']?>'">Proses</button>
             <?php if ($fill['status']=='dibayar'){?>
             
           <?php } } } else {}?>


                     </td></tr>
            <?php
            $i++;
            $count++;
        }

        ?>
                  </tbody></table>
                  <div align="right"><?php if($tcount>=$rpp){ echo paginate_one($reload, $page, $tpages);}else{} ?></div>
    <?php } ?>
<div class="col-xs-1" align="right">
          <a href="add_buy" class="btn btn-info" role="button">Beli barang</a>
        </div>
                               </div>
                                <!-- /.box-body -->
                            </div>

                            <?php } else {} ?>
                        </div>
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                    </div>
                    <!-- /.row (main row) -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
           <?php footer();?>
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->
        <script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

<script>
function myFunction() {
  alert("INGAT! Menghapus transaksi tidak akan mengubah stok kembali seperti semula");
}
</script>
        <script src="dist/bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="dist/plugins/morris/morris.min.js"></script>
        <script src="dist/plugins/sparkline/jquery.sparkline.min.js"></script>
        <script src="dist/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="dist/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="dist/plugins/knob/jquery.knob.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
        <script src="dist/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="dist/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="dist/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="dist/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="dist/plugins/fastclick/fastclick.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/pages/dashboard.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="dist/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="dist/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="dist/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="dist/plugins/fastclick/fastclick.js"></script>

    </body>
</html>
