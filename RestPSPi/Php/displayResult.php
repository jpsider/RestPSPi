<!DOCTYPE html>
<html lang="en">
<?php
	require_once 'components/header.php';
	include 'components/callAPIFunction.php';
?>
<?php
    // Get the Names, if empty, display error, then go to index.php
	if (!empty($_GET['FindMatch'])) {
		$name01=$_GET['name01'];
		$name02=$_GET['name02'];

	} else {
		echo "No Names provided.";
		header("Refresh:10 url=index.php");
	}
	echo "<body>";
	$url = "http://localhost:8082/Endpoint/Match?Name01=$name01&Name02=$name02";
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
		<h3>PES MatchMaker Results:</h3>
		<div class="card-columns card-columns-4">
			<div class="flex-item">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="clipboard" size="24"></clr-icon>&nbsp Contestant 1 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3>
					<center>
						<p class="card-text">
                        <?php
							echo "Name: <h2>".$finalResponse["Name01"]."</h2></br>";
                            echo "Temp: <h2>".$finalResponse["Temp01"]."</h2></br>";
                        ?>
						</p>
					</center>
				</div>
			</div><!-- End Card -->
			</div><!-- End Card -->
			<div class="flex-item">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="clipboard" size="24"></clr-icon>&nbsp Contestant 2 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3>
					<center>
						<p class="card-text">
                        <?php
							echo "Name: <h2>".$finalResponse["Name02"]."</h2></br>";
                            echo "Temp: <h2>".$finalResponse["Temp02"]."</h2></br>";
                        ?>
						</p>
					</center>
				</div>
			</div><!-- End Card -->
			</div><!-- End Card -->
		</div><!-- End Card Columns -->
		<div class="card-columns card-columns-2" >
		<div class="flex-item">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="plugin" size="24"></clr-icon>&nbsp Result:</h3>
					<center>
						<p class="card-text">
                        <?php
							if($finalResponse["MatchResult"] == "NoMatch"){
								echo "<h2>".$finalResponse["MatchResult"]."</h2><clr-icon shape='thumbs-down' class='is-solid' size='72'></clr-icon></br>";
							} elseif($finalResponse["MatchResult"] == "Match"){
								echo "<h2>".$finalResponse["MatchResult"]."</h2><clr-icon shape='thumbs-up' class='is-solid' size='72'></clr-icon><clr-icon shape='thumbs-up' class='is-solid' size='72'></clr-icon></br>";
							} elseif($finalResponse["MatchResult"] == "ExactMatch"){
								echo "<h2>".$finalResponse["MatchResult"]."</h2><clr-icon shape='flame' class='is-solid' size='72'></clr-icon><clr-icon shape='thumbs-up' class='is-solid' size='72'></clr-icon><clr-icon shape='flame' class='is-solid' size='72'></clr-icon></br>";
							} else {
								echo "<h2>Error!</h2><clr-icon shape='flame' class='is-solid' size='72'>";
							}
                        ?>
						</p>
						<form action="index.php" method="get"><input type="Submit" class="btn btn-success-outline" value="Start Over"></td></form>
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