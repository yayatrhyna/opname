<?php
include 'config_connect.php';
date_default_timezone_set("Asia/Jakarta");
$harisekarang=date('d');
$bulansekarang=date('m');

$tahunsekarang=date('Y');
$now=date('Y-m-d');
$bulanlalu = date('m',strtotime("-1 month"));
$tahunlalu = date('Y',strtotime("-1 year"));
$today = date('d-m-Y : H:i');

// Total Data1

$sqlx2="SELECT COUNT(userna_me) as data FROM user";
$hasilx2=mysqli_query($conn,$sqlx2);
$row=mysqli_fetch_assoc($hasilx2);
$datax1=$row['data'];

// Total Data2

$sqlx2="SELECT COUNT(kode) as data FROM supplier";
$hasilx2=mysqli_query($conn,$sqlx2);
$row=mysqli_fetch_assoc($hasilx2);
$datax2=$row['data'];

// Total Data3

$sqlx2="SELECT COUNT(kode) as data FROM barang";
$hasilx2=mysqli_query($conn,$sqlx2);
$row=mysqli_fetch_assoc($hasilx2);
$datax3=$row['data'];

// Total Data4

 
$sql= "SELECT batas from backset";
$hasilx2=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($hasilx2);
$alert = $row['batas'];


$sqlx2="SELECT COUNT(kode) as data FROM barang where sisa <= '$alert' ";
$hasilx2=mysqli_query($conn,$sqlx2);
$row=mysqli_fetch_assoc($hasilx2);
$datax4=$row['data'];


  
// Data Stok

$sqlx2="SELECT SUM(sisa) AS data FROM barang ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $stok1=$row['data'];

$sqlx2="SELECT SUM(terjual) AS data FROM barang ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $stok2=$row['data'];

$sqlx2="SELECT SUM(terbeli) AS data FROM barang ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $stok3=$row['data'];

$sqlx2="SELECT SUM(kode) AS data FROM barang ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $stok4=$row['data'];


$sqlx2="SELECT SUM(total) AS data FROM buy ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv11=$row['data'];

$sqlx2="SELECT SUM(total) AS data FROM buy WHERE status LIKE '%dibayar%' ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv12=$row['data'];

$sqlx2="SELECT SUM(total) AS data FROM buy WHERE status LIKE '%belum%' ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv13=$row['data'];

$sqlx2="SELECT SUM(total) AS data FROM buy WHERE tglsale < '$now' AND status LIKE '%belum%'  ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv14=$row['data'];

  // Data Invoice

$sqlx2="SELECT SUM(total) AS data FROM sale ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv1=$row['data'];

$sqlx2="SELECT SUM(total) AS data FROM sale WHERE status LIKE '%dibayar%' ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv2=$row['data'];

$sqlx2="SELECT SUM(total) AS data FROM sale WHERE status LIKE '%belum%' ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv3=$row['data'];

$sqlx2="SELECT SUM(total) AS data FROM sale WHERE tglsale < '$now' AND status LIKE '%belum%'  ";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $inv4=$row['data'];

// Total Data1-------------------------------------------------------------------

  $sqlx2="SELECT COUNT(nota) as data FROM beli WHERE nota NOT IN (SELECT nota FROM transaksibeli)";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data11=$row['data'];

  // Total Data2

  $sqlx2="SELECT COUNT(nota) as data FROM beli WHERE nota IN (SELECT nota FROM transaksibeli)";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data21=$row['data'];

  // Total Data3

  $sqlx2="SELECT COUNT(nota) as data FROM beli WHERE nota IN (SELECT nota FROM transaksibeli) AND tglbeli LIKE '$tahunsekarang-$bulansekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data31=$row['data'];

  // Total Data4

  $sqlx2="SELECT COUNT(nota) as data FROM beli WHERE nota IN (SELECT nota FROM transaksibeli) AND tglbeli LIKE '$tahunsekarang-$bulansekarang-$harisekarang'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data41=$row['data'];

   // Total Data1 ------------------------------------------------------------------

  $sqlx2="SELECT COUNT(nota) as data FROM bayar WHERE nota NOT IN (SELECT nota FROM transaksimasuk)";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data1=$row['data'];

  // Total Data2

  $sqlx2="SELECT COUNT(nota) as data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk)";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data2=$row['data'];

  // Total Data3

  $sqlx2="SELECT COUNT(nota) as data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-$bulansekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data3=$row['data'];

  // Total Data4

  $sqlx2="SELECT COUNT(nota) as data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-$bulansekarang-$harisekarang'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data4=$row['data'];

  // Total Data1-------------------------------------------------------------------

  $sqlx2="SELECT SUM(biaya) AS data FROM operasional";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data14=$row['data'];

  // Total Data2

  $sqlx2="SELECT SUM(biaya) AS data FROM operasional WHERE tanggal LIKE '$tahunsekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data24=$row['data'];

  // Total Data3

  $sqlx2="SELECT SUM(biaya) AS data FROM operasional WHERE tanggal LIKE '$tahunsekarang-$bulansekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data34=$row['data'];

  // Total Data4

  $sqlx2="SELECT SUM(biaya) AS data FROM operasional WHERE tanggal LIKE '$tahunsekarang-$bulansekarang-$harisekarang'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data44=$row['data'];

  // Total Data1-------------------------------------------------------------------

  $sqlx2="SELECT SUM(total) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk)";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data12=$row['data'];

  // Total Data2

  $sqlx2="SELECT SUM(total) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data22=$row['data'];

  // Total Data3

  $sqlx2="SELECT SUM(total) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-$bulansekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data32=$row['data'];

  // Total Data4

  $sqlx2="SELECT SUM(total) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-$bulansekarang-$harisekarang'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data42=$row['data'];
// Total Data1-------------------------------------------------------------------

  $sqlx2="SELECT (SUM(total)-SUM(keluar)) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk)";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data13=$row['data'];

  // Total Data2

  $sqlx2="SELECT (SUM(total)-SUM(keluar)) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data23=$row['data'];

  // Total Data3

  $sqlx2="SELECT (SUM(total)-SUM(keluar)) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-$bulansekarang-%'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data33=$row['data'];

  // Total Data4

  $sqlx2="SELECT (SUM(total)-SUM(keluar)) AS data FROM bayar WHERE nota IN (SELECT nota FROM transaksimasuk) AND tglbayar LIKE '$tahunsekarang-$bulansekarang-$harisekarang'";
  $hasilx2=mysqli_query($conn,$sqlx2);
  $row=mysqli_fetch_assoc($hasilx2);
  $data43=$row['data'];

?>
