<!DOCTYPE html>
<html lang="en">
<?php
	require_once 'components/header.php';
	include 'components/callAPIFunction.php';
?>
	<div class="flex-container flex-wrap">
		<h3>PES MatchMaker</h3>
		<div class="card-columns">
			<div class="card">
				<div class="card-block">
					<h3 class="card-title"><clr-icon shape="cpu" size="24"></clr-icon>&nbsp Let's Get Started!</h3>
					<center>
						<p class="card-text">
							<h2>First Person</h2></br>
							<h2>Second Person</h2></br>
						</p>
						Button to Start it!
					</center>
				</div>
			</div><!-- End Card -->
		</div><!-- End Card Columns -->
	</div><!-- End  Flex container -->
		<nav class="sidenav">
			<?php
				require_once 'components/Side_Bar.html';
			?>
		</nav>
	</div>
</body>