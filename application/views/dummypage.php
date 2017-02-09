<?php
	defined('BASEPATH') OR exit('No direct script access allowed.');
?>
<html lang='en'>
	<head>
		<title>Costa-Abril Quotation</title>
		<style>
			body{
				font-family: "Calibri" !important;
				page-break-inside: auto;
			}
			.column1{
				width:20%;
				border: 1px solid black;
				position: relative;
			}
			.column2{
				width:100%;
				border: 1px solid red;
				position: relative;
			}
			.quotationHeader{
				font-family: "Helvetica";
				font-size:2em;
				font-weight: 500;
				text-align: center;
				color: rgb(214,42,6);
			}
			.contactInfo{
				font-family: "Helvetica";
				font-size:small;
				font-weight: 500;
				text-align: center;
				color: rgb(214,42,6);
				vertical-align: top;
				position: absolute;
			}
		</style>
	</head>
	<body>
		<table style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
			<tr>
				<td class="column1" rowspan="2">
					<img src="./assets/img/logo.png" width="250" height="150" style="top: 0;">
					<br />
					<span class="contactInfo">
						<p>
						• 514 1282
						• 534 8119
						• 0922 832 0098
						</p>
						<br />
						<p>#40 Dao St. San Jose, Rodriguez, Rizal</p>
					</span>
				</td>
				<td class="column2 quotationHeader">
					COSTA ABRIL RESORT
				</td>
			</tr>
			<tr>
				<td>
					<p>
						<?php echo date("j F Y"); ?>
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
						1.	Entrance fee for eighty (80) persons
						2.	Use of Five (5) Villa Rooms - good for 10 pax each
							   Amenities in each room: 
						•	2 King-sized beds
						•	Complimentary mattress 
						•	Toilet and bath
						•	Outdoor Dining Area
						3.    Use of Open Villa #5 (for group activities) with complimentary videoke
						4.    Exclusive use of elevated Private Pool surrounded by villas
						5.    Use of Public Pools 
						•	Kiddie Pool with water playground
						•	Beach Pool
						•	Adult Pool
						6.     Access to resort Wi-fi
						
						Attached to this quotation are photos of the Private Villa. Additional photos of Costa Abril resort may be viewed at the resort’s Facebook page (www.facebook.com/costaabril).
						
						Rates for this package during daytime swimming is 20,000 Php while the nighttime swimming package is charged at 20,000 Php. In addition, you may also opt to avail of our Function Hall, for a larger area which can accommodate around 100 heads, for 3,000 Php for daytime or nighttime.
						
						Hoping for your favorable response! 
						
						Sincerely yours,
						
						Dr. Ma. Teresa H. Villa-Abrile

					</span>
				</td>
			</tr>
		</table>
	</body>
</html>