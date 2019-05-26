<!DOCTYPE html>
<html lang="en">
<?php
	require_once 'components/header.php';
	include 'components/callAPIFunction.php';
?>
	<div class="flex-container flex-wrap">
		<div class="card-columns">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="play" size="24"></clr-icon>&nbsp Let's Get Started!</h3>
					<center>
						<p class="card-text">
						<form action="displayResult.php" method="get">
							<h2>First Person</h2></br>
							<input type="text" name="name01" value="name01">
							<h2>Second Person</h2></br>
							<input type="text" name="name02" value="name02">
						</p>
						<input type="hidden" name="FindMatch" value="TRUE">
						<input type="Submit" class="btn btn-success-outline" value="Are they a Match ?">
						</form>
					</center>
				</div>
			</div><!-- End Card -->
		</div><!-- End Card Columns -->
	</div><!-- End  Flex container -->
</body>