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
				$('#rEventTimeStart').datetimepicker({format:'hh:mm A'});
				$('#rEventTimeEnd').datetimepicker({format:'hh:mm A'});
			});
		</script>
		<script type="text/javascript" src="<?php echo $libs . 'react/react.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'react/react-dom.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'cajs/ca-global.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'cajs/ca-ops.js';?>"></script>
	</body>
</html> 