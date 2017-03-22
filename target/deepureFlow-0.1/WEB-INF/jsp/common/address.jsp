<script src="<%=request.getContextPath()%>/js/common/address.js"></script>
<script type="text/javascript">
	$(function() {
		selectProvince();
	});
</script>

<div class="form-horizontal">
	<input type="hidden" id="userId" />
	<div class="form-group">
		<div  class="col-sm-4">
					<select id="province" name="province"
			onchange="setTimeout(function(){selectCity();}, 500);"
			class='form-control kwidth30percent kdisplay-inline'></select>
		</div>
	
		<div class="col-sm-4">
				<select id="city" name="city"
			onchange="setTimeout(function(){selectDistrict();}, 500);"
			class='form-control kwidth30percent kdisplay-inline'></select>
		</div>
			<div class="col-sm-4">
		<select id="district" name="district"
			class='form-control kwidth30percent kdisplay-inline'></select>
	</div>
	</div>


</div>