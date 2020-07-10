<?php 
require_once "koneksi.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Form Input User</title>
	<link rel="stylesheet" href="asset/css1/bootstrap.min.css">
</head>
<body>
	<div class= "container-fluid">
		<div class="row">
			<div class= "col-12 text-light" style="background-color: #33ccff;">
				<img src="asset/images/gbr3.jpg" alt="" style="width: 100%; height: 600px">
			</div>

			<nav class="navbar col-12 navbar-expand-lg navbar-dark sticky-top" style="background-color: #33ccff; padding-left: 15px; margin-right: 10px;">
				<a class="navbar-brand" href="#">Ryanaldi</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item">
							<a class="nav-link active" href="LatihanBootstrap4.html">Home</a>
						</li>
						<!-- <li class="nav-item">
							<a class="nav-link" href="#">Facilities</a>
						</li>
						<li class="nav-item ">
							<a class="nav-link active" href="#">Guest Book</a>
						</li>    
						<li class="nav-item ">
							<a class="nav-link active" href="Table.html">Daftar Komentar</a>
						</li>  
					</ul> -->
					<form class="form-inline my-2 my-lg-0 ">
						<input class="form-control mr-sm-2" type="text" placeholder="search"> 
						<button class="btn btn-success my-2 my-sm-0" type="button">search</button>
					</form>
				</div>  
			</nav>

			<div class=" col-12 col-md-8 col-lg-8 container" style="background-color:; width: 100px;">
				<h2 align="center" style="margin-top: 50px;">Form Input Data User</h2>
				<form action="prosesinsert.php" method="post" style="padding-right: 100px; padding-left: 100px;">
					<div class="form-group">
						<label for="namaUser"></label>
						<input type="text" class="form-control" placeholder="Masukan Nama" name="namaUser">
					</div>
					<!-- <select class="form-control" name="nama_barang" id="nama_barang" style="margin-top: 30px;">
						<option value="">Nama Barang</option>
						<option value="Transistor">Transistor</option>
						<option value="Dioda">Dioda</option>
						<option value="Resistor">Resistor</option>
						<option value="Capasitor">Capasitor</option>
						<option value="IC 555">IC 555</option>
					</select> -->
					<!-- <div class="form-group" style="margin-top: 30px;">
						<label for="email">Nama Barang</label>
						<input type="email" class="form-control" id="nama" placeholder="Enter name" name="nama" required="">
					</div> -->
					<!-- <select class="form-control" name="combo1" id="combo1">
						<option value="">Harga Barang</option>
						<option value="Harga Barang1">1000</option>
						<option value="Harga Barang2">4000</option>
						<option value="Harga Barang3">500</option>
						<option value="Harga Barang4">3000</option>
						<option value="Harga Barang5">10000</option>
					</select> -->
					<div class="form-group">
						<label for="emailUser"></label>
						<input type="email" class="form-control" placeholder="Masukan Email" name="emailUser" required>
					</div>
					<div class="form-group">
						<label for="passwordUser"></label>
						<input type="password" class="form-control" placeholder="Masukan Password" name="passwordUser" required>
					</div>
					<button type="submit" class="btn btn-primary btn-lg" name="kirim">Kirim</button>
				</form>
				<br>
				<!-- Tabel data -->
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>No</th>
							<th>Nama</th>
							<th>Email</th>
							<th>Action</th>

						</tr>
					</thead>
					<tbody>
						<?php 
						$sql = "SELECT*FROM tb_users";
						$result = $conn->query($sql);

						if($result->num_rows > 0){
								//Akan dijalanan jika recordnya ada
							while ($row = $result->fetch_assoc()){ ?>
								<tr>
									<td><?=$row['id_user']?></td>
									<td><?=$row['nama_user']?></td>
									<td><?=$row['email_user']?></td>
									<td>
										<a class="btn btn-danger" href="prosesDeleteUser.php?id=<?=$row['id_user']?>">Delete
										</a>
									</td>
								</tr>

								<?php
							}
						}else{
								//Akan dijalankan jika recordnya kosong
							echo "<tr><td colspan='3'>Recordnya masih kosong</td></tr>";
						}
						?>
					</tbody>
				</table>
			</div>

			<div class="col-12 col-md-4 col-lg-2 bg-danger text-light pt-4" align="justify" style="margin-top: 20px;">

				<form class="box" action="proseslogin.php" method="post">

					<h2 align="center">Login Here</h2>
					<br>

					<input type="text" name="ryanaldirivans" placeholder="Username" class="btn-lg btn-block">
					<br>

					<input type="password" name="password1" placeholder="Password" class="btn-lg btn-block">
					<br>

					<input type="submit" name="login" value="Login" class="btn-lg">

				</form>

			</div>
			<div class="col-12 bg-info text-light" align="center">Copyright @Ryanaldi 2020</div>
		</div>
	</div>

	<script src="asset/js1/jquery.min.js"></script>
	<script src="asset/js1/popper.min.js"></script>
	<script src="asset/js1/bootstrap.min.js"></script>
</body>
</html>