<?php echo $header; ?>

<?php //echo $column_left; ?>

<?php //echo $column_right; ?>


<div class="row">

	<?php echo $content_top; ?>

	<ol class="breadcrumb">

		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
		<?php } ?>

	</ol>


	<div class="row product-info">


		<!-- Imagem do produto -->
		<?php if ($thumb || $images) { ?>

			<div class="col-md-6 text-center">

				<?php if ($thumb) { ?>

					<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"> <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"/> </a>

				<?php } ?>

				<?php if ($images) { ?>

					<div class="row">

						<?php foreach ($images as $image) { ?>

							<div class="col-md-4">
								<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
									<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="col-md-12" />
								</a>
							</div> <!-- col-md-4 -->

						<?php } ?>

					</div> <!-- row -->

				<?php } ?>

			</div> <!-- col-md-6 -->

		<?php } ?> <!-- End if $thumb -->

		<div class="col-md-6">


			<!-- Descrição do produto -->
			<div class="row">

				<div class="col-md-12"> <h1> <?php echo $heading_title; ?> </h1> </div> <!-- col-md-12 -->

				<?php if ($manufacturer) { ?>

					<div class="col-md-12">
						<span> <?php echo $text_manufacturer; ?> </span> <a href="<?php echo $manufacturers; ?>"> <?php echo $manufacturer; ?> </a>
					</div> <!-- col-md-12 -->

				<?php } ?>

				<div class="col-md-12">
					
					<span> <?php echo $text_model; ?> </span> <?php echo $model; ?>

				</div> <!-- col-md-12 -->

				<div class="col-md-12">
					
					<?php if ($reward) { ?>
						<span> <?php echo $text_reward; ?> </span> <?php echo $reward; ?>
					<?php } ?>
					
					<span> <?php echo $text_stock; ?> </span> <?php echo $stock; ?>

				</div> <!-- col-md-12 -->

			</div> <!-- row -->


			<!-- Preço do produto -->
			<?php if ($price) { ?>

				<div class="row">

					<div class="col-md-12">
						
						<?php echo $text_price; ?>

						<?php if (!$special) { ?>
							<?php echo $price; ?>
						<?php } else { ?>
							<span class="price-old"> <?php echo $price; ?> </span> <span class="price-new"> <?php echo $special; ?> </span>
						<?php } ?>

						<br />

						<?php if ($tax) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
						<?php } ?>

						<?php if ($points) { ?>
							<span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
						<?php } ?>
						
						<?php if ($discounts) { ?>
							<br />
							<div class="discount">
								<?php foreach ($discounts as $discount) { ?>
								<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
								<?php } ?>
							</div>
						<?php } ?>

					</div> <!-- col-md-12 -->

				</div> <!-- row -->

			<?php } ?>


			<?php if ($profiles): ?>

				<div class="row profiles">

					<div class="col-md-12">
						
						<h2> <span class="required"> * </span> <?php echo $text_payment_profile ?> </h2>
						
						<select name="profile_id">
							<option value=""> <?php echo $text_select; ?> </option>

							<?php foreach ($profiles as $profile): ?>
								<option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
							<?php endforeach; ?>
						</select>
						
						<span id="profile-description"></span>

					</div> <!-- col-md-12 -->

				</div> <!-- row -->

			<?php endif; ?>

			
			<?php if ($options) { ?>


				<div class="options row">


					<div class="col-md-12">
						
						
						<h2> <?php echo $text_option; ?> </h2>


						<?php foreach ($options as $option) { ?>


							<!-- Caso a opção seja multipla (select) -->
							<?php if ($option['type'] == 'select') { ?>

								
								<div class="row">
									
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option col-md-12">

										<?php if ($option['required']) { ?>

											<span class="required"> * </span>

										<?php } ?>

										<b> <?php echo $option['name']; ?> : </b> <br />

										<div class="form-group col-md-6">
											
											<select name="option[<?php echo $option['product_option_id']; ?>]" class="form-control">

												<option value=""> <?php echo $text_select; ?> </option>

												<?php foreach ($option['option_value'] as $option_value) { ?>

													<option value="<?php echo $option_value['product_option_value_id']; ?>">

														<?php echo $option_value['name']; ?>
														<?php if ($option_value['price']) { ?>
															(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>

													</option>

												<?php } ?>

											</select> 

										</div> <!-- form-group col-md-6 -->

									</div> <!-- col-md-12 -->

								</div> <!-- row -->
								

							<?php } ?>


							<!-- Caso a opção seja unica (radiobox) -->
							<?php if ($option['type'] == 'radio') { ?>

								<div class="row">
									
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option col-md-12">

										<?php if ($option['required']) { ?>

										<span class="required"> * </span>
										<?php } ?>

										<b> <?php echo $option['name']; ?> : </b> <br />

										<?php foreach ($option['option_value'] as $option_value) { ?>

											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
											<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</label>
											<br />

										<?php } ?>

									</div> <!-- col-md-12 -->

								</div> <!-- row -->

							<?php } ?>


							<!-- Caso seja multiplas marcações (checkbox) -->
							<?php if ($option['type'] == 'checkbox') { ?>

								<div class="row">
									
									<div class="col-md-12">
										
										<div id="option-<?php echo $option['product_option_id']; ?>" class="option">

											<?php if ($option['required']) { ?>

												<span class="required">*</span>

											<?php } ?>

											<b> <?php echo $option['name']; ?> : </b> <br />

											<?php foreach ($option['option_value'] as $option_value) { ?>

												<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
												<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
												<br />

											<?php } ?>

										</div> <!-- option -->

									</div> <!-- col-md-12 -->

								</div> <!-- row -->

							<?php } ?>


							<!-- Caso seja uma imagem -->
							<?php if ($option['type'] == 'image') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="option">

									<?php if ($option['required']) { ?>
										<span class="required"> * </span>
									<?php } ?>

									<b> <?php echo $option['name']; ?> : </b> <br />

									<table class="option-image">
										<?php foreach ($option['option_value'] as $option_value) { ?>
										<tr>
											<td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
											<td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
											<td>
												<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</td>
										</tr>
										<?php } ?>
									</table>

								</div>
								<br />

							<?php } ?>


							<!-- Opções de texto (text) -->
							<?php if ($option['type'] == 'text') { ?>

								<div class="row">
										
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group col-md-12">

										<?php if ($option['required']) { ?>
											<span class="required">*</span>
										<?php } ?>

										<b> <?php echo $option['name']; ?> : </b> <br />

										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="form-control" />

									</div> <!-- col-md-12 -->

								</div> <!-- row -->

							<?php } ?>


							<!-- Caso seja preenchimento de um campo -->
							<?php if ($option['type'] == 'textarea') { ?>

								<div class="row">
									
									<div class="col-md-12">
										
										<div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group">
											<?php if ($option['required']) { ?>
												<span class="required"> * </span>
											<?php } ?>

											<b> <?php echo $option['name']; ?> : </b> <br />

											<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5" class="form-control"><?php echo $option['option_value']; ?></textarea>
										</div>

									</div> <!-- col-md-12 -->

								</div> <!-- row -->

							<?php } ?>


							<!-- Caso seja um arquivo -->
							<?php if ($option['type'] == 'file') { ?>

								<div class="row">
									
									<div class="col-md-12">
										
										<div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group">

											<?php if ($option['required']) { ?>
												<span class="required">*</span>
											<?php } ?>

											<b> <?php echo $option['name']; ?> : </b> <br />

											<input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-default">
											<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />

										</div> <!-- form-group -->

									</div> <!-- col-md-12 -->

								</div> <!-- row -->
							
							<?php } ?>


							<!-- Caso seja uma data -->
							<?php if ($option['type'] == 'date') { ?>

								<div class="row">
									
									<div class="col-md-4">

										<div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group">

											<?php if ($option['required']) { ?>
												<span class="required">*</span>
											<?php } ?>

											<b> <?php echo $option['name']; ?> : </b> <br />

											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date form-control" />

										</div> <!-- form-group -->
										
									</div> <!-- col-md-4 -->

								</div> <!-- row -->

							<?php } ?>


							<!-- Caso seja data e hora -->
							<?php if ($option['type'] == 'datetime') { ?>

								<div class="row">
									
									<div class="col-md-4">
										
										<div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group">

											<?php if ($option['required']) { ?>
												<span class="required"> * </span>
											<?php } ?>
											<b> <?php echo $option['name']; ?> : </b> <br />

											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime form-control" />

										</div> <!-- form-group -->

									</div> <!-- col-md-4 -->

								</div> <!-- row -->

							<?php } ?>


							<!-- Caso seja uma hora específica -->
							<?php if ($option['type'] == 'time') { ?>

								<div class="row">
									
									<div class="col-md-4">
										
										<div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group">

											<?php if ($option['required']) { ?>
												<span class="required"> * </span>
											<?php } ?>

											<b> <?php echo $option['name']; ?> : </b> <br />

											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time form-control" />

										</div> <!-- form-group -->

									</div> <!-- col-md-4 -->

								</div> <!-- row -->

							<?php } ?>


						<?php } ?> <!-- End foreach $options -->


					</div> <!-- col-md-12 -->


				</div> <!-- row options -->


			<?php } ?> <!-- End if $options -->


				<div class="row">

					<div class="col-md-12">

						<?php echo $text_qty; ?>

						<input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
						<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />

						&nbsp;

						<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="btn btn-default" />

						<span> &nbsp;&nbsp; <?php echo $text_or; ?> &nbsp;&nbsp; </span>

						<span class="links"> <a onclick="addToWishList('<?php echo $product_id; ?>');"> <?php echo $button_wishlist; ?> </a> <br />
							<a onclick="addToCompare('<?php echo $product_id; ?>');"> <?php echo $button_compare; ?> </a>
						</span>

					</div>


					<?php if ($minimum > 1) { ?>
						<div class="minimum"><?php echo $text_minimum; ?></div>
					<?php } ?>

				</div>


			<?php if ($review_status) { ?>

				<div class="review">

					<div><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>

					<div class="share"><!-- AddThis Button BEGIN -->

						<div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
						<script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
						<!-- AddThis Button END --> 

					</div>

				</div>

			<?php } ?>

		</div> <!-- col-md-6 -->


	</div> <!-- product-info -->


	<div id="tabs" class="htabs row"> <a href="#tab-description"> <?php echo $tab_description; ?> </a>

		<?php if ($attribute_groups) { ?>
			<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
		<?php } ?>

		<?php if ($review_status) { ?>
			<a href="#tab-review"><?php echo $tab_review; ?></a>
		<?php } ?>

		<?php if ($products) { ?>
			<a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
		<?php } ?>

	</div>


	<div id="tab-description" class="row tab-content"> <?php echo $description; ?> </div>


	<?php if ($attribute_groups) { ?>

		<div id="tab-attribute" class="tab-content">
			<table class="attribute">

				<?php foreach ($attribute_groups as $attribute_group) { ?>

				<thead>
					<tr>
						<td colspan="2"><?php echo $attribute_group['name']; ?></td>
					</tr>
				</thead>
				<tbody>

					<?php foreach ($attribute_group['attribute'] as $attribute) { ?>

						<tr>
							<td><?php echo $attribute['name']; ?></td>
							<td><?php echo $attribute['text']; ?></td>
						</tr>

					<?php } ?>

				</tbody>

				<?php } ?>

			</table>
		</div>

	<?php } ?>


	<?php if ($review_status) { ?>

		<div id="tab-review" class="row tab-content">
			<div id="review"></div>
			<h2 id="review-title"><?php echo $text_write; ?></h2>
			<b><?php echo $entry_name; ?></b><br />
			<input type="text" name="name" value="" />
			<br />
			<br />
			<b><?php echo $entry_review; ?></b>
			<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
			<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
			<br />
			<b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
			<input type="radio" name="rating" value="1" />
			&nbsp;
			<input type="radio" name="rating" value="2" />
			&nbsp;
			<input type="radio" name="rating" value="3" />
			&nbsp;
			<input type="radio" name="rating" value="4" />
			&nbsp;
			<input type="radio" name="rating" value="5" />
			&nbsp;<span><?php echo $entry_good; ?></span><br />
			<br />
			<b><?php echo $entry_captcha; ?></b><br />
			<input type="text" name="captcha" value="" />
			<br />
			<img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
			<br />
			<div class="buttons">
				<div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
			</div>
		</div>

	<?php } ?>


	<?php if ($products) { ?>

		<div id="tab-related" class="tab-content">

			<div class="box-product">

				<?php foreach ($products as $product) { ?>

					<div>
						<?php if ($product['thumb']) { ?>
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
						<?php } ?>
						<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
						</div>
						<?php } ?>
						<?php if ($product['rating']) { ?>
						<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
						<?php } ?>
						<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
					</div>

				<?php } ?>

			</div>

		</div>

	<?php } ?>
				

	<?php if ($tags) { ?>

		<div class="tags"> <b> <?php echo $text_tags; ?> </b>

			<?php for ($i = 0; $i < count($tags); $i++) { ?>

				<?php if ($i < (count($tags) - 1)) { ?>

					<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,

				<?php } else { ?>

					<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>

				<?php } ?>

			<?php } ?>

		</div>

	<?php } ?>
				

	<?php echo $content_bottom; ?>

</div>


<script type="text/javascript"><!--
	$(document).ready(function() {
		$('.colorbox').colorbox({
			overlayClose: true,
			opacity: 0.5,
			rel: "colorbox"
		});
	});
	//-->
</script> 
					
<script type="text/javascript"><!--

	$('select[name="profile_id"], input[name="quantity"]').change(function(){
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
			dataType: 'json',
			beforeSend: function() {
				$('#profile-description').html('');
			},
			success: function(json) {
				$('.success, .warning, .attention, information, .error').remove();

				if (json['success']) {
					$('#profile-description').html(json['success']);
				}	
			}
		});
	});

	$('#button-cart').bind('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
			dataType: 'json',
			success: function(json) {
				$('.success, .warning, .attention, information, .error').remove();

				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
						}
					}

					if (json['error']['profile']) {
						$('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
					}
				} 

				if (json['success']) {
					$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

					$('.success').fadeIn('slow');

					$('#cart-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
			}
		});
	});
//-->
</script>


<?php if ($options) { ?>

	<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

	<?php foreach ($options as $option) { ?>

		<?php if ($option['type'] == 'file') { ?>

			<script type="text/javascript"><!--
				new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
					action: 'index.php?route=product/product/upload',
					name: 'file',
					autoSubmit: true,
					responseType: 'json',
					onSubmit: function(file, extension) {
						$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
						$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
					},
					onComplete: function(file, json) {
						$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);

						$('.error').remove();

						if (json['success']) {
							alert(json['success']);

							$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
						}

						if (json['error']) {
							$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
						}

						$('.loading').remove();	
					}
				});
			//-->
			</script>

		<?php } ?>

	<?php } ?>

<?php } ?>


<script type="text/javascript"><!--
	$('#review .pagination a').live('click', function() {
		$('#review').fadeOut('slow');
		
		$('#review').load(this.href);

		$('#review').fadeIn('slow');

		return false;
	});			

	$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

	$('#button-review').bind('click', function() {
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
			beforeSend: function() {
				$('.success, .warning').remove();
				$('#button-review').attr('disabled', true);
				$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
			},
			complete: function() {
				$('#button-review').attr('disabled', false);
				$('.attention').remove();
			},
			success: function(data) {
				if (data['error']) {
					$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
				}

				if (data['success']) {
					$('#review-title').after('<div class="success">' + data['success'] + '</div>');

					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').attr('checked', '');
					$('input[name=\'captcha\']').val('');
				}
			}
		});
	});
//--></script> 


<script type="text/javascript"><!--

	$('#tabs a').tabs();
	//-->

</script> 


<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 


<script type="text/javascript"><!--
	$(document).ready(function() {
		if ($.browser.msie && $.browser.version == 6) {
			$('.date, .datetime, .time').bgIframe();
		}

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});
		$('.time').timepicker({timeFormat: 'h:m'});
	});
	//-->
</script>


<?php echo $footer; ?>