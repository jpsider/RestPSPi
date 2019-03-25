<!DOCTYPE html>
<html lang="en">
<?php
	require_once 'components/header.php';
	include 'components/callAPIFunction.php';
?>
<?php
    // Get the Names, if empty, display error, then go to index.php




	$url = "http://localhost:8080/Endpoint/Match?Name01=Justin&name02=Kelly";
	$curl = curl_init();
    curl_setopt_array($curl, 
        array(
            CURLOPT_URL => "$url",
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
        )
    );
	$response = curl_exec($curl);
	$err = curl_error($curl);
	curl_close($curl);
	//echo $response;
	$finalResponse = json_decode($response, true);
	//echo "</br>";
	//echo 'Name01:' .$finalResponse["Name01"];
	//echo "</br>";
	//echo 'Temp01:' .$finalResponse["Temp01"];
	//echo "</br>";
    //echo 'Name02:' .$finalResponse["Name02"];
    //echo "</br>";
    //echo 'Temp02:' .$finalResponse["Temp02"];    
    //echo "</br>";
	//echo 'Temp02:' .$finalResponse["MatchResult"]; 
		?>
	<div class="content-container" style="justify-content:center">
	<div class="flex-container flex-wrap">
		<h3>PES MatchMaker</h3>
		<div class="card-columns card-columns-4">
			<div class="flex-item">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="plugin" size="24"></clr-icon>&nbsp Contestant 1</h3>
					<center>
						<p class="card-text">
                        <?php
							echo "<h2>Name: ".$finalResponse["Name01"]."</h2></br>";
                            echo "<h2>Temp: ".$finalResponse["Temp01"]."</h2></br>";
                        ?>
						</p>
						Button to Start it!
					</center>
				</div>
			</div><!-- End Card -->
			</div><!-- End Card -->
			<div class="flex-item">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="plugin" size="24"></clr-icon>&nbsp Contestant 2</h3>
					<center>
						<p class="card-text">
                        <?php
							echo "<h2>Name: ".$finalResponse["Name02"]."</h2></br>";
                            echo "<h2>Temp: ".$finalResponse["Temp02"]."</h2></br>";
                        ?>
						</p>
						Button to Start it!
					</center>
				</div>
			</div><!-- End Card -->
			</div><!-- End Card -->
		</div><!-- End Card Columns -->
		<div class="card-columns card-columns-2" >
		<div class="flex-item">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="plugin" size="24"></clr-icon>&nbsp Result</h3>
					<center>
						<p class="card-text">
                        <?php
							echo "<h2>Result: ".$finalResponse["MatchResult"]."</h2></br>";
                        ?>
						</p>
						Button to Start it!
					</center>
				</div>
			</div><!-- End Card -->
		</div><!-- End Card -->
		</div><!-- End Card -->
		</div><!-- End Card -->
	</div><!-- End  Flex container -->
</div>
	</div><!-- End Main Container -->
</body>
</html>