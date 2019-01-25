<!DOCTYPE html>
<html lang="en">
<?php
	require_once 'components/header.php';
	include 'components/callAPIFunction.php';
?>
	<div class="content-area">
		Stuff is in here
		<?php
			$url = "http://192.168.2.3:8084/endpoint/Temp";


			$curl = curl_init();

			curl_setopt_array($curl, array(
			  CURLOPT_URL => "http://192.168.2.3:8084/endpoint/Temp",
			  CURLOPT_RETURNTRANSFER => true,
			  CURLOPT_ENCODING => "",
			  CURLOPT_MAXREDIRS => 10,
			  CURLOPT_TIMEOUT => 30,
			  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			  CURLOPT_CUSTOMREQUEST => "GET",
			  CURLOPT_HTTPHEADER => array(
			    "cache-control: no-cache",
			    "content-type: application/json",
			  ),
			));

			$response = curl_exec($curl);
			$err = curl_error($curl);

			curl_close($curl);

			echo $response;

			$finalResponse = json_decode($response, true);
			echo "</br>";
			echo 'Current Temp:' .$finalResponse["Temperature"];
			echo "</br>";
			echo 'Current Pressure:' .$finalResponse["Pressure"];
			echo "</br>";
			echo 'Current Humidity:' .$finalResponse["Humidity"];
		?>
	</div>
            <nav class="sidenav">
					<?php
						require_once 'components/Side_Bar.html';
					?>
			</nav>
    </div>
</body>