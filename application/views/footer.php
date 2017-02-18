<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	$libs = str_replace('index.php','assets', base_url());
?>

		<script type="text/javascript" src="<?php echo $libs . 'jquery/external/jquery/jquery-3.1.1.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'moment.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'jquery/jquery-ui.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'react/react.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'react/react-dom.min.js';?>"></script>		
		<script type="text/javascript" src="<?php echo $libs . 'bootstrap/js/bootstrap.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'bootstrap/js/bootstrap-datetimepicker.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'cajs/ca-global.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'cajs/ca-ops.js';?>"></script>
		<!--<script type="text/javascript" src="<?php echo $libs . 'cajs/ca-react-ops.js';?>"></script>//-->
		<!--[if lt IE 9]>
		<script>
		(function(){
		  var ef = function(){};
		  window.console = window.console || {log:ef,warn:ef,error:ef,dir:ef};
		}());
		</script>
		<script type="text/javascript" src="<?php echo $libs . 'html5shiv.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'html5shiv-printshiv.min.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'es5-shim.js';?>"></script>
		<script type="text/javascript" src="<?php echo $libs . 'es5-sham.js';?>"></script>
	</body>
</html> 