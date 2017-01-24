<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	$libs = str_replace('index.php','assets', base_url());
?>
		
		<script type="text/javascript" src="<?php echo $libs . 'jquery/external/jquery/jquery-3.1.1.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'moment.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'jquery/jquery-ui.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'bootstrap/js/bootstrap.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'bootstrap/js/bootstrap-datetimepicker.min.js';?>"></script>
		<script type="text/javascript">
			$(function () {
				$.support.transition = true;
				$('#rEventDate').datetimepicker({format:'DD-MMM-YYYY'});
				$('#rEventTime').datetimepicker({format:'hh:mm A'});
			});
		</script>
	</body>
</html>