<!DOCTYPE html>
<html>
<?php
include "configuration/config_etc.php";
include "configuration/config_include.php";
etc();encryption();session();connect();head();body();timing();
//alltotal();
pagination();
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
                <!-- Main content -->
                <section class="content">
                    <div class="row">
            <div class="col-lg-12">
                        <!-- ./col -->

<!-- SETTING START-->

<?php
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
include "configuration/config_chmod.php";
$halaman = "bayar_inv"; // halaman
$dataapa = "Penjualan"; // data
$tabeldatabase = "barang"; // tabel database
$chmod = $chmenu4; // Hak akses Menu
$forward = mysqli_real_escape_string($conn, $tabeldatabase); // tabel database
$forwardpage = mysqli_real_escape_string($conn, $halaman); // halaman
$search = $_POST['search'];
$insert = $_POST['insert'];
$nota= $_GET['nota'];
 
?>


<!-- SETTING STOP -->
 <?php

    if($nota == null || $nota == ""){

            $sqle="SELECT SUM(hargaakhir) as data FROM invoicejual WHERE nota='$nota' ";
            $hasile=mysqli_query($conn,$sqle);
            $row=mysqli_fetch_assoc($hasile);
            $datatotal=$row['data'];

            $sqle="SELECT SUM(hargabeliakhir) as data FROM invoicejual WHERE nota='$nota'";
            $hasile=mysqli_query($conn,$sqle);
            $row=mysqli_fetch_assoc($hasile);
            $databelitotal=$row['data'];
    }else{

      $sqle="SELECT SUM(hargaakhir) as data FROM invoicejual WHERE nota='$nota'";
      $hasile=mysqli_query($conn,$sqle);
      $row=mysqli_fetch_assoc($hasile);
      $datatotal=$row['data'];

      $sqle="SELECT SUM(hargabeliakhir) as data FROM invoicejual WHERE nota='$nota'";
      $hasile=mysqli_query($conn,$sqle);
      $row=mysqli_fetch_assoc($hasile);
      $databelitotal=$row['data'];


    }

    ?>

<!-- BREADCRUMB -->
<?php 

//menyimpan ke tabel bayar

   

    if(isset($_POST["simpan"])){
       if($_SERVER["REQUEST_METHOD"] == "POST"){
           
            $cust = mysqli_real_escape_string($conn, $_POST["pelanggan"]);
            
            if($cust == ''){ 
                $pelanggan = '0001';
                
            } else { $pelanggan = $cust;
            }

              $nota = mysqli_real_escape_string($conn, $_POST["nota"]);
              $duedate = mysqli_real_escape_string($conn, $_POST["duedate"]);
              $diskon = mysqli_real_escape_string($conn, $_POST["diskon"]);
              $total = mysqli_real_escape_string($conn, $_POST["total"]);
              $tglnota = mysqli_real_escape_string($conn, $_POST["tglnota"]);
             
              
              
              $keterangan = mysqli_real_escape_string($conn, $_POST["keterangan"]);
              $kasir = $_SESSION["username"];
              $berhasil = "berhasil";
              $belum = "belum";
              $insert = ($_POST["insert"]);


                 $sql="select * from $tabel where nota='$kode'";
            $result=mysqli_query($conn,$sql);

                  if(mysqli_num_rows($result)>0){

                    echo "<script type='text/javascript'>  alert('Data tidak bisa diubah!');</script>";
              }
          else if(( $chmod >= 2 || $_SESSION['jabatan'] == 'admin')){

               $sql2 = "insert into sale values( '$nota','$tglnota','$duedate','$total','$diskon','$pelanggan','$kasir','$keterangan','','$belum')";
               $insertan = mysqli_query($conn, $sql2);
//update mutasi
               $sql3 = "UPDATE mutasi SET status='$berhasil' where keterangan='$kode'";
               $updatemutasi = mysqli_query($conn, $sql3);


               echo "<script type='text/javascript'>  alert('Berhasil, Data telah disimpan!'); </script>";
               echo "<script type='text/javascript'>window.location = 'penjualan';</script>";
             }else{
              echo "<script type='text/javascript'>  alert('Gagal, Data gagal disimpan! Pastikan pembayaran benar');</script>";

             }

      }

    }


?>

<!-- BREADCRUMB -->

<!-- BOX INSERT BERHASIL -->

         <script>
 window.setTimeout(function() {
    $("#myAlert").fadeTo(500, 0).slideUp(1000, function(){
        $(this).remove();
    });
}, 5000);
</script>


       <!-- BOX INFORMASI -->
    <?php
if ($chmod >= 2 || $_SESSION['jabatan'] == 'admin') {
  ?>


  <!-- KONTEN BODY AWAL -->
                         <!-- Default box -->
                         <div class="col-lg-12">
      <div class="main box">

       

<div class="row">


        <div class="box-body col-lg-7">
         

            <!--tabel-->

<div class="box-body no-padding">
     <?php
     
           error_reporting(E_ALL ^ E_DEPRECATED);

           $sql    = "select * from invoicejual where nota ='$nota' order by no";
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
              <table class="table table-condensed">
               <thead>
                      <tr>
                          <th>No</th>
                          <th style="width: 55%">Nama Barang</th>
                          
                          <th>Jumlah Jual</th>
                          <th>Total</th>
           
                      </tr>
                  </thead>

                  <?php
           error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
           while(($count<$rpp) && ($i<$tcount)) {
           mysqli_data_seek($result,$i);
           $fill = mysqli_fetch_array($result);
           ?>
            <tbody>
           <tr>
           <td><?php echo ++$no_urut;?></td>
           
           <td><?php  echo mysqli_real_escape_string($conn, $fill['nama']); ?></td>
           
           <td><?php  echo mysqli_real_escape_string($conn, $fill['jumlah']); ?> x <?php  echo mysqli_real_escape_string($conn, number_format($fill['harga'], $decimal, $a_decimal, $thousand).',-'); ?></td>
           <td><?php  echo mysqli_real_escape_string($conn, number_format(($fill['jumlah']*$fill['harga']), $decimal, $a_decimal, $thousand).',-'); ?></td>
          </tr>
           <?php
           $i++;
           $count++;
           }

           ?>
           </tbody>


              </table>
            </div>
            <!--end tabel-->


        </div>

         <div class="box-body">
            <div class="col-lg-4">
                                        <script>
                                   function sum1() {
                                         var txtFirstNumberValue =  document.getElementById('subtotal').value
                                         var txtSecondNumberValue = document.getElementById('diskon').value;
                                         var result = parseFloat(txtFirstNumberValue) - parseFloat(txtSecondNumberValue);
                                         if (!isNaN(result)) {
                                            document.getElementById('total').value = result;
                                            
                                         }
                                       if (!$(bayar).val()){
                                         document.getElementById('total').value = "0";
                                       }
                                       if (!$(total).val()){
                                         document.getElementById('total').value = "0";
                                       }
                                   }
                                   </script>

                                   
                <!-- /.box-header -->
            <div class="box-body no-padding">
<form  method="post" id="Myform" class="form-user">

              <table class="table table-striped">
                <tr>


                  
                  <th>Sub total</th>
                  <input type="hidden" value="<?php echo $nota;?>" class="form-control" name="nota">
                  <input type="hidden" value="<?php echo $datatotal;?>" class="form-control" id="subtotal">
                  
                  
                  <th ><input type="text" value="<?php echo number_format($datatotal, $decimal, $a_decimal, $thousand).',-'; ?>" class="form-control" readonly></th>
                </tr>
                <tr>
                 
                  <td>Diskon</td>
                 
                  <td><input type="text" class="form-control" autocomplete="off" id="diskon" name="diskon" value="0" onkeyup="sum1();"></td>
                </tr>
                <tr>


                                      
                  <td>Total</td>
                 
                  <td><input type="text" class="form-control" value="<?php echo $datatotal;?>" id="total" name="total" readonly></td>
                </tr>
                <tr>
                  
                  <td>Tanggal Transaksi</td>
                  
                  <td><input type="text" class="form-control" id="datepicker2" name="tglnota"></td>

                </tr>
                <tr>
                  
                  <td>Jatuh Tempo</td>
                  
                  <td><input type="text" class="form-control" id="datepicker" name="duedate"></td>

                </tr>

               

                <tr>
                  
                  <td>Pelanggan</td>
                  
                  <td><select style="width:100%" name="pelanggan" class="select2">
                      <option ></option>
                      <?php
                                    $sql=mysqli_query($conn,"select * from pelanggan");
                                    while ($row=mysqli_fetch_assoc($sql)){
                                      if ($pelanggan==$row['kode'])
                                      echo "<option value='".$row['kode']."' selected='selected'>".$row['kode']." | ".$row['nama']."</option>";
                                      else
                                      echo "<option value='".$row['kode']."'>".$row['kode']." | ".$row['nama']."</option>";
                                    }
                                  ?>
                    </select></td>
                </tr>
                <tr>

                 <tr>
                  
                  <td>Keterangan</td>
                  
                  <td><textarea name="keterangan" style="width:100%"></textarea> </td>

                </tr>

                



                 <tr>
                  
                  <td > <input type="button" class="btn btn-block pull-left btn-flat btn-danger"  onclick="window.open('add_jual','_self')" value="KEMBALI" /> </td>
                  <td ><button type="submit" class="btn btn-block pull-left btn-flat btn-success" name="simpan" onclick=" document.getElementById('Myform').submit();" >SIMPAN</button></td>
                  
                  

                </tr>
              </table>
          </form>
            </div>
            <!-- /.box-body -->
            </div>
         

           


        </div>

</div>
                                <!-- /.box-body -->
                            </div>
                       

                       </div>

                       <!--
<script>
function myFunction() {
    document.getElementById("Myform").submit();
}

         var helpWindow;

function Struk(url) {
    helpWindow = window.open(url, 'helpWindow');


}
      </script>

  -->

  <!---STRUK-->




        </div>

                                <!-- /.box-body -->
                            </div>
                       

                       </div>

<?php
} else {
?>
   <div class="callout callout-danger">
    <h4>Info</h4>
    <b>Hanya user tertentu yang dapat mengakses halaman <?php echo $dataapa;?> ini .</b>
    </div>
    <?php
}
?>
                        <!-- ./col -->
                    </div>

                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <!-- /.Left col -->
                    </div>
                    <!-- /.row (main row) -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <?php  footer(); ?>
            <div class="control-sidebar-bg"></div>
        </div>
          <!-- ./wrapper -->

<!-- Script -->
    <script src='jquery-3.1.1.min.js' type='text/javascript'></script>

    <!-- jQuery UI -->
    <link href='jquery-ui.min.css' rel='stylesheet' type='text/css'>
    <script src='jquery-ui.min.js' type='text/javascript'></script>

<script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

        <script>
  $.widget.bridge('uibutton', $.ui.button);
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
        <script src="dist/js/demo.js"></script>
    <script src="dist/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="dist/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="dist/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="dist/plugins/fastclick/fastclick.js"></script>
    <script src="dist/plugins/select2/select2.full.min.js"></script>
    <script src="dist/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="dist/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="dist/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="dist/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="dist/plugins/iCheck/icheck.min.js"></script>

<!--fungsi AUTO Complete-->
<!-- Script -->
    <script type='text/javascript' >
    $( function() {
  
        $( "#barcode" ).autocomplete({
            source: function( request, response ) {
                
                $.ajax({
                    url: "server.php",
                    type: 'post',
                    dataType: "json",
                    data: {
                        search: request.term
                    },
                    success: function( data ) {
                        response( data );
                    }
                });
            },
            select: function (event, ui) {
                $('#nama').val(ui.item.label);
                $('#barcode').val(ui.item.value); // display the selected text
                $('#hargajual').val(ui.item.hjual);
                $('#stok').val(ui.item.sisa); // display the selected text
                $('#hargabeli').val(ui.item.hbeli);
                $('#jumlah').val(ui.item.jumlah);
                $('#kode').val(ui.item.kode); // save selected id to input
                return false;
                
            }
        });

        // Multiple select
        $( "#multi_autocomplete" ).autocomplete({
            source: function( request, response ) {
                
                var searchText = extractLast(request.term);
                $.ajax({
                    url: "server.php",
                    type: 'post',
                    dataType: "json",
                    data: {
                        search: searchText
                    },
                    success: function( data ) {
                        response( data );
                    }
                });
            },
            select: function( event, ui ) {
                var terms = split( $('#multi_autocomplete').val() );
                
                terms.pop();
                
                terms.push( ui.item.label );
                
                terms.push( "" );
                $('#multi_autocomplete').val(terms.join( ", " ));

                // Id
                var terms = split( $('#selectuser_ids').val() );
                
                terms.pop();
                
                terms.push( ui.item.value );
                
                terms.push( "" );
                $('#selectuser_ids').val(terms.join( ", " ));

                return false;
            }
           
        });
    });

    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }

    </script>

<!--AUTO Complete-->

<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("yyyy-mm-dd", {"placeholder": "yyyy/mm/dd"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("yyyy-mm-dd", {"placeholder": "yyyy/mm/dd"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'YYYY/MM/DD h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Hari Ini': [moment(), moment()],
            'Kemarin': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Akhir 7 Hari': [moment().subtract(6, 'days'), moment()],
            'Akhir 30 Hari': [moment().subtract(29, 'days'), moment()],
            'Bulan Ini': [moment().startOf('month'), moment().endOf('month')],
            'Akhir Bulan': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );
$('#datepicker').datepicker('update', new Date());
    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

   $('.datepicker').datepicker({
    dateFormat: 'yyyy-mm-dd'
 });

   //Date picker 2
   $('#datepicker2').datepicker('update', new Date());

    $('#datepicker2').datepicker({
      autoclose: true
    });

   $('.datepicker2').datepicker({
    dateFormat: 'yyyy-mm-dd'
 });


    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>
</body>
</html>
