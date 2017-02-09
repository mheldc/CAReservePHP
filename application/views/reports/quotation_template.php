<?php
	defined('BASEPATH') OR exit('No direct script access allowed.');
	$dtToday = date("j F Y");
?>
<html lang="en">
	<head>
		<title>Costa-Abril Quotation</title>
		<style>
			
			body{
				font-family: Helvetica !important;
			}
			hr{
				border:2px solid #8B0000;
			}
			p{
				font-family: Calibri;
			}	
			
			table{
				width: 100%;
				height: 100%;
				page-break-after: always;
			}
			
			.imgLogo{
				width: 200px;
				height: 120px;
				position: absolute;
				top: 20;
			}
			.imgThumbnail{
				width: 400px;
				height: 300px;
				text-align: center;
				bottom: 0;
			}
			.column1{
				width:20%;
				position: relative;
				text-align:top;
			}
			.column2{
				width:100%;
				position: relative;
			}
			.quotationHeader{
				font-size:2em;
				font-weight: 500;
				text-align: center;
				color: #8B0000;
			}
			.contactInfo{
				font-size: 10px;
				color: #8B0000;
				vertical-align: top;
				position: absolute;
				top:150;
			}
			
		</style>
	</head>
	<body>
		<table style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
			<tr>
				<td class="column1" rowspan="2">
					<img src="./assets/img/logo.png" class="imgLogo">
					<br />
					<span class="contactInfo">
						<p>514 1282 | 534 8119 | 0922 832 0098</p>

						<p>#40 Dao St. San Jose, Rodriguez, Rizal</p>
					</span>
				</td>
			</tr>
			<tr>
				<td style="font-size:12px;">
					<p>
						<?php echo $dtToday; ?>
					</p>
					<br />
					<p>
						To: Ms. Donna Turalba
					</p>
					<br />
					<p>
						Warm greetings! 
					</p>
						We are pleased to present to you this quotation for a day and night tour at Costa Abril Resort. Inclusions for this quotation are the following:
						<ul style="list-style-type: decimal;">
							<li>	Entrance fee for eighty (80) persons</li>
							<li>	Use of Five (5) Villa Rooms - good for 10 pax each</li>
							<ul style="list-style-type: disc;">
								Amenities in each room:
								<li>	2 King-sized beds</li>
								<li>	Complimentary mattress</li>
								<li>	Toilet and bath</li>
								<li>	Outdoor Dining Area</li>
							</ul>
							<li>	Use of Open Villa #5 (for group activities) with complimentary videoke</li>
							<li>	Exclusive use of elevated Private Pool surrounded by villas</li>
							<li>	Use of Public Pools </li>
							<ul style="list-style-type: disc;">
								<li>	Kiddie Pool with water playground</li>
								<li>	Beach Pool</li>
								<li>	Adult Pool</li>
							</ul>
							<li>	Access to resort Wi-fi</li>
						</ul>
						<br />
						<p>
							Attached to this quotation are photos of the Private Villa. Additional photos of Costa Abril resort may be viewed at the resort’s Facebook page (www.facebook.com/costaabril).
						</p>
						
						<p>
							Rates for this package during daytime swimming is 20,000 Php while the nighttime swimming package is charged at 20,000 Php. In addition, you may also opt to avail of our Function Hall,
							for a larger area which can accommodate around 100 heads, for 3,000 Php for daytime or nighttime.
						</p>
						<p>
							Hoping for your favorable response! 
						</p>
						<br />
						<p>
							Sincerely yours,
						</p>
						<br>
						<p>
							Dr. Ma. Teresa H. Villa-Abrile
						</p>						

						<br>
			
					</span>
				</td>
			</tr>
		</table>
		<table class="pgbreak">
			<tr><td><img src="./assets/img/villa/villa-1.jpg" class="imgThumbnail"></td></tr>
			<tr><td><img src="./assets/img/villa/villa-2.jpg" class="imgThumbnail"></td></tr>
			<tr><td><img src="./assets/img/villa/villa-3.jpg" class="imgThumbnail"></td></tr>
		</table>
	</body>
</html>